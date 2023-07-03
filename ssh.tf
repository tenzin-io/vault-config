resource "vault_mount" "ssh" {
  type        = "ssh"
  path        = var.ssh_secret_mount_path
  description = "The SSH secrets store for signing keys"
}

resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}
