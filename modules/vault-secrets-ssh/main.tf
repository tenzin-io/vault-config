terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_mount" "ssh" {
  type        = "ssh"
  path        = var.mount_path
  description = var.description
}

resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}

resource "vault_ssh_secret_backend_role" "ssh_user" {
  for_each           = toset(var.ssh_users)
  name               = each.key
  allowed_users      = each.key
  default_user       = each.key
  ttl                = var.key_ttl
  backend            = vault_mount.ssh.path
  default_extensions = var.key_extensions
  key_type           = "ca"
  allow_user_certificates = true
}
