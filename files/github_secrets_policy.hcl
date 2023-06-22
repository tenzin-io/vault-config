path "${mount_path}/data/${secret_path}" {
  capabilities = ["list", "read"]
}

path "${mount_path}/metadata/${secret_path}" {
  capabilities = ["list", "read"]
}

path "auth/token/create" {
  capabilities = ["create", "read", "update", "list"]
}
