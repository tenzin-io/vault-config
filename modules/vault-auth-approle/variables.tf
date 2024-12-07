variable "mount_path" {
  type        = string
  default     = "approle"
  description = "The path to mount the authentication method"
}

variable "description" {
  type        = string
  default     = "The AppRole authentication method"
  description = "The description of the authentication method"
}

variable "allowed_apps" {
  type = map(list(string))
  description = "A map of allowed apps that can login to Vault"
}