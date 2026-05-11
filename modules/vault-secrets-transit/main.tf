terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.0"
    }
  }
}

resource "vault_mount" "transit" {
  path        = var.mount_path
  type        = "transit"
  description = var.description
}
