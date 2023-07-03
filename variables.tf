variable "vault_admin_password" {
  type        = string
  sensitive   = true
  description = "The Vault admin password"
}

variable "ssh_secret_mount_path" {
  type        = string
  description = "The mount path for the ssh secret store"
  default     = "ssh-client-signer"
}

variable "github_secret_mount_path" {
  type        = string
  description = "The mount path for the github secret store"
  default     = "github"
}

variable "github_repo_to_secret_paths" {
  type        = map(list(string))
  default     = {}
  description = "A map of GitHub repo to its allowed secret paths under the github secret store"
}
