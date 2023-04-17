path "${secrets_engine_mount_path}/*" {
  capabilities = ["list", "read"]
}

path "auth/token/create" {
  capabilities = ["create", "read", "update", "list"]
}
