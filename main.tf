terraform {
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

#
# Secrets engines
#
module "secrets_kv" {
  source = "./modules/secrets-kv"
}

#
# Secrets access policy
#
resource "vault_policy" "read_secrets" {
  name = "secrets-access"
  policy = templatefile("${path.module}/files/read_secrets_policy.hcl", {
    secrets_engine_mount_path = module.secrets_kv.secrets_engine_mount_path
  })
}

#
# Auth methods
#
module "auth_jwt_github" {
  source               = "./modules/auth-jwt-github"
  allowed_github_repos = local.allowed_github_repos
}
