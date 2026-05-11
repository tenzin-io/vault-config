terraform {
  required_version = "~> 1.9"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tenzin-io"
    key    = "terraform/vault-tenzin-io.tfstate"
    region = "us-east-1"
  }
}

provider "vault" {
  address = "https://vault.tenzin.io"
}

module "vault_auth_userpass" {
  source = "./modules/vault-auth-userpass"
  vault_allowed_users = {
    "admin"      = ["admin"]
  }
  vault_secrets_mount_path = module.vault_secrets_kv.mount_path
}

module "vault_secrets_kv" {
  source       = "./modules/vault-secrets-kv"
  mount_path   = "secrets"
  max_versions = 30
}
