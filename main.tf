terraform {
  required_version = "~> 1.9"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket       = "tenzin-cloud"
    key          = "terraform/vault-tenzin-cloud.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "vault" {
  address = "https://vault.tenzin.io"
}

module "vault_policies" {
  source = "./modules/vault-policies"
  vault_policies = {
    "vault-admin" = [
      { path = "*", capabilities = ["create", "read", "update", "delete", "list", "sudo"] },
      { path = "secrets/data/*", capabilities = ["create", "read", "update", "delete", "list", "sudo"] },
    ],
    "github-repos" = [
      { path = "auth/token/create", capabilities = ["create", "read", "update", "list"] },
      { path = "secrets/data/*" },
      { path = "kubernetes-secrets/data/kubeconfig/*" }
    ],
    "tenzin-bot" = [
      { path = "secrets/data/docker-hub/tenzinbot", capabilities = ["read", "list"] },
      { path = "kubernetes-secrets/data/kubeconfig/*", capabilities = ["create", "update"] },
      { path = "auth/token/create", capabilities = ["create", "read", "update", "list"] },
    ]
  }
}

module "vault_auth_userpass" {
  source               = "./modules/vault-auth-userpass"
  vault_admin_username = "admin"
  vault_admin_password = var.vault_admin_password
  vault_admin_policies = ["vault-admin"]
  vault_allowed_users = {
    "tenzin-bot" = ["tenzin-bot"]
  }
  vault_secrets_mount_path = module.vault_secrets_kv.mount_path
  depends_on               = [module.vault_policies]
}

module "vault_auth_github" {
  source = "./modules/vault-auth-github"
  allowed_github_repos = {
    "tenzin-io/test-actions-workflows" = ["github-actions-token"]
    "tenzin-io/platform-setup"         = ["github-actions-token", "github-repos"]
  }
  depends_on = [module.vault_policies]
}

# module "vault_auth_approle" {
#   source = "./modules/vault-auth-approle"
#   allowed_apps = {
#     "kubeconfig-publisher" = ["kubeconfig-publish"]
#   }
#   depends_on = [module.vault_policies]
# }

module "vault_secrets_kv" {
  source       = "./modules/vault-secrets-kv"
  mount_path   = "secrets"
  max_versions = 30
}

module "kubernetes_secrets_kv" {
  source       = "./modules/vault-secrets-kv"
  mount_path   = "kubernetes-secrets"
  max_versions = 30
}

module "vault_secrets_ssh" {
  source    = "./modules/vault-secrets-ssh"
  ssh_users = ["tenzin-bot"]
}
