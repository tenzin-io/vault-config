variable "mount_path" {
  type    = string
  default = "userpass"
}

variable "description" {
  type    = string
  default = "Vault userpass authentication engine"
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