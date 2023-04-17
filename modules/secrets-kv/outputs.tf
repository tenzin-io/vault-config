output "secrets_engine_mount_path" {
  description = "The path of the mounted secrets engine"
  value       = vault_mount.kv.path
}
