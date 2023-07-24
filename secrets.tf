#
# Secrets store for GitHub repos 
#
resource "vault_mount" "secrets" {
  path        = "secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "A secret engine to store static secrets"
}

resource "vault_kv_secret_backend_v2" "secrets" {
  mount        = vault_mount.secrets.path
  max_versions = 15
  cas_required = false
}
