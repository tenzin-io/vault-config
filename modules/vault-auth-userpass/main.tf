terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.0"
    }
  }
}

locals {
  default_policies = {
    "reader" = [
      { path = "${var.vault_secrets_mount_path}/data/*",     capabilities = toset(["read", "list"]),                                description = null },
      { path = "${var.vault_secrets_mount_path}/metadata/*", capabilities = toset(["read", "list"]),                                description = null },
    ]
    "editor" = [
      { path = "${var.vault_secrets_mount_path}/data/*",     capabilities = toset(["create", "read", "update", "delete", "list"]), description = null },
      { path = "${var.vault_secrets_mount_path}/metadata/*", capabilities = toset(["read", "list"]),                                description = null },
    ]
    "admin" = [
      { path = "*", capabilities = toset(["create", "read", "update", "delete", "list", "sudo"]), description = null },
    ]
  }
  effective_policies = merge(local.default_policies, var.vault_policies)
}

resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  path        = var.mount_path
  description = var.description

  tune {
    default_lease_ttl = var.token_ttl
    max_lease_ttl     = var.token_ttl
  }
}

data "vault_policy_document" "policy" {
  for_each = local.effective_policies
  dynamic "rule" {
    for_each = each.value
    content {
      path         = rule.value.path
      capabilities = rule.value.capabilities
      description  = rule.value.description
    }
  }
}

resource "vault_policy" "policy" {
  for_each = local.effective_policies
  name     = each.key
  policy   = data.vault_policy_document.policy[each.key].hcl
}

resource "random_password" "vault_user" {
  for_each = var.vault_allowed_users
  special  = false
  length   = 32
}

resource "vault_kv_secret_v2" "vault_user_credentials" {
  for_each = length(var.vault_secrets_mount_path) > 0 ? var.vault_allowed_users : {}
  mount    = var.vault_secrets_mount_path
  name     = "${var.vault_userpass_secrets_path_prefix}/${each.key}"
  data_json = jsonencode({
    username = each.key
    password = random_password.vault_user[each.key].result
  })
  custom_metadata {
    data = {
      managed_by  = "terraform"
      description = "Auto-generated credentials for the '${each.key}' userpass account. Editing this secret has no effect on the Vault userpass account; credentials are managed by Terraform."
    }
  }
}

resource "vault_generic_endpoint" "vault_users" {
  for_each             = var.vault_allowed_users
  path                 = "auth/${vault_auth_backend.userpass.path}/users/${each.key}"
  ignore_absent_fields = true
  depends_on           = [vault_policy.policy]
  data_json = jsonencode({
    policies = each.value
    password = random_password.vault_user[each.key].result
  })
}
