resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "vault_admin" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"
  ignore_absent_fields = true

  data_json = <<-EOT
    {
      "policies": [ "${vault_policy.vault_admin.name}"],
      "password": "${var.vault_admin_password}"
    }
    EOT
}

resource "vault_policy" "vault_admin" {
  name   = "vault-admin"
  policy = data.vault_policy_document.vault_admin
}

data "vault_policy_document" "vault_admin" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list"]
  }
}
