terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_policy" "policy" {
  for_each = var.vault_policies
  name     = each.key
  policy   = data.vault_policy_document.policy[each.key].hcl
}

data "vault_policy_document" "policy" {
  for_each = var.vault_policies
  dynamic "rule" {
    for_each = each.value
    content {
      path         = rule.value.path
      capabilities = rule.value.capabilities
      description  = rule.value.description
    }
  }
}
