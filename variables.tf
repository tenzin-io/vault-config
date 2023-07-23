variable "vault_admin_password" {
  type        = string
  sensitive   = true
  description = "The Vault admin password"
}

variable "github_repo_to_secret_paths" {
  type        = map(list(string))
  default     = {}
  description = "A map of GitHub repo to its allowed secret paths under the github secret store"
}
