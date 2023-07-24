variable "vault_admin_password" {
  type        = string
  sensitive   = true
  description = "The password to configure for Vault admin user"
}

variable "github_repos" {
  type = map(object({
    secrets   = optional(list(string), [])
    ssh_users = optional(list(string), [])
  }))
  default     = {}
  description = "A map of GitHub repo to its allowed secret paths under the github secret store"
}
