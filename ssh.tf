resource "vault_mount" "ssh" {
  type        = "ssh"
  path        = "ssh"
  description = "The secret engine to sign SSH certificates"
}

resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}

resource "vault_ssh_secret_backend_role" "ssh_user" {
  for_each      = toset(distinct(flatten([for k, v in var.github_repos : v.ssh_users])))
  name          = "${each.value}-role"
  allowed_users = each.value
  default_user  = each.value
  ttl           = "43200" # 12 hours
  backend       = vault_mount.ssh.path
  key_type      = "ca"
  default_extensions = {
    "permit-pty"       = "",
    "agent-forwarding" = "",
    "port-forwarding"  = ""
  }
  allow_user_certificates = true
}
