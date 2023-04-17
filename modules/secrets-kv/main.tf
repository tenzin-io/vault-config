resource "vault_mount" "kv" {
  path        = var.secrets_engine_path
  type        = "kv"
  options     = { version = "2" }
  description = "KV version 2 secret engine mount"
}

resource "vault_kv_secret_backend_v2" "kv" {
  mount        = vault_mount.kv.path
  max_versions = 15
  cas_required = false
}
