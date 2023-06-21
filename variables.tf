variable "vault_admin_password" {
  type        = string
  sensitive   = true
  description = "The Vault admin password"
}

variable "allowed_github_repos" {
  type = list(object({
    claims       = map(string)
    secret_paths = list(string)
  }))
  default     = []
  description = "A list of allowed GitHub repos via the JWT auth method."
}
