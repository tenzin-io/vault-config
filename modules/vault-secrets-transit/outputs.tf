output "mount_path" {
  value       = vault_mount.transit.path
  description = "The mount path of the transit secrets engine"
}

output "policy_rules" {
  value = [
    { path = "${vault_mount.transit.path}/encrypt/*", capabilities = toset(["update"]),        description = null },
    { path = "${vault_mount.transit.path}/decrypt/*", capabilities = toset(["update"]),        description = null },
    { path = "${vault_mount.transit.path}/rewrap/*",  capabilities = toset(["update"]),        description = null },
    { path = "${vault_mount.transit.path}/keys/*",    capabilities = toset(["read", "list"]),  description = null },
  ]
  description = "Policy rules granting encrypt, decrypt, rewrap, and key-read access to the transit engine. Pass to vault-auth-userpass vault_policies under a chosen name."
}
