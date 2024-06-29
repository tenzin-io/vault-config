terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_jwt_auth_backend" "github" {
  description        = var.description
  path               = var.mount_path
  oidc_discovery_url = var.oidc_discovery_url
  bound_issuer       = var.bound_issuer
}

resource "vault_jwt_auth_backend_role" "github_repo" {
  for_each        = var.allowed_github_repos
  backend         = vault_jwt_auth_backend.github.path
  role_name       = format("%s", replace(each.key, "/", "."))
  token_policies  = each.value
  bound_audiences = ["https://github.com/${dirname(each.key)}"]
  bound_claims = {
    repository = each.key
  }
  bound_claims_type = "string"
  user_claim        = "sub"
  role_type         = "jwt"
}