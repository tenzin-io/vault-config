resource "vault_mount" "ssh" {
  type        = "ssh"
  path        = "ssh"
  description = "The secret engine to sign SSH certificates"
}

resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}

resource "vault_ssh_secret_backend_role" "root" {
  name                    = "root-role"
  allowed_users           = "root"
  default_user            = "root"
  ttl                     = "4h"
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  allow_user_certificates = true
}
