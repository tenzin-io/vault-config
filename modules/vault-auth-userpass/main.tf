terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  path        = var.mount_path
  description = var.description
}

resource "vault_generic_endpoint" "vault_admin" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/${var.vault_admin_username}"
  ignore_absent_fields = true

  data_json = jsonencode({
    policies = var.vault_admin_policies
    password = var.vault_admin_password
  })
}