terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "tenzin-io"
    key            = "terraform/homelab-vault.state"
    dynamodb_table = "tenzin-io"
    region         = "us-east-1"
  }
}

provider "vault" {
  address = "https://vault.tenzin.io"
}

module "vault_policies" {
  source = "./modules/vault-policies"
  vault_policies = {
    "vault-admin" = [{
      path         = "*"
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }],
    "github-actions-token" = [{
      path         = "auth/token/create"
      capabilities = ["create", "read", "update", "list"]
    }]
  }
}

module "vault_auth_userpass" {
  source               = "./modules/vault-auth-userpass"
  vault_admin_username = "admin"
  vault_admin_password = var.vault_admin_password
  vault_admin_policies = ["vault-admin"]
  depends_on           = [module.vault_policies]
}

module "vault_auth_github" {
  source = "./modules/vault-auth-github"
  allowed_github_repos = {
    "tenzin-io/test-actions-workflows" = ["github-actions-token"]
  }
  depends_on = [module.vault_policies]
}

module "vault_secrets_kv" {
  source       = "./modules/vault-secrets-kv"
  max_versions = 30
}

module "vault_secrets_ssh" {
  source    = "./modules/vault-secrets-ssh"
  ssh_users = ["tenzin-bot"]
}

