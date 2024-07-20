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

variable "global_bound_cidrs" {
  type        = list(string)
  default     = []
  description = "The bound_cidrs at parent scope"
}

variable "allowed_apps" {
  type = map(object({
    bound_cidrs = optional(list(string), [])
    policies    = set(string)
  }))
  description = "A map of allowed apps that can login to Vault"
}