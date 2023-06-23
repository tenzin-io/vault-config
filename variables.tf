variable "vault_admin_password" {
  type        = string
  sensitive   = true
  description = "The Vault admin password."
}

variable "github_secret_mount_path" {
  type        = string
  description = "The secret store mount path"
  default     = "github"
}

variable "github_repo_to_secret_paths" {
  type        = map(list(string))
  default     = {}
  description = "A map of GitHub repo to allowed secret paths under the github_secret_mount_path"
}
