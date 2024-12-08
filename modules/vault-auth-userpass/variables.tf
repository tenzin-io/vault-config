variable "mount_path" {
  type    = string
  default = "userpass"
}

variable "description" {
  type    = string
  default = "The Userpass authentication method"
}

variable "token_ttl" {
  type        = string
  default     = "8h"
  description = "The lifetime of the token"
}

variable "vault_admin_username" {
  type    = string
  default = "admin"
}

variable "vault_admin_password" {
  type      = string
  sensitive = true
}

variable "vault_admin_policies" {
  type = set(string)
}

variable "vault_allowed_users" {
  type = map(list(string))
}

variable "vault_secrets_mount_path" {
  type        = string
  description = "The mount path to secrets engine to store the vault user credentials"
  default     = ""
}