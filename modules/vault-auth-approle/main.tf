terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
}

resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = var.mount_path
  description = var.description
}

resource "vault_approle_auth_backend_role" "app" {
  for_each              = var.allowed_apps
  backend               = vault_auth_backend.approle.path
  role_name             = each.key
  role_id               = sha1(each.key)
  token_policies        = each.value
  bind_secret_id        = false
  secret_id_bound_cidrs = ["0.0.0.0/0"]
}

resource "vault_approle_auth_backend_login" "login" {
  for_each = var.allowed_apps
  backend  = vault_auth_backend.approle.path
  role_id  = vault_approle_auth_backend_role.app[each.key].role_id
}
