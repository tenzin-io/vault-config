variable "description" {
  type    = string
  default = "The Vault JWT authentication engine for GitHub"
}

variable "mount_path" {
  type    = string
  default = "jwt"
}

variable "oidc_discovery_url" {
  type        = string
  default     = "https://token.actions.githubusercontent.com"
  description = "The OIDC discovery URL"
}

variable "bound_issuer" {
  type        = string
  default     = "https://token.actions.githubusercontent.com"
  description = "The OIDC bound issuer URL"
}

variable "allowed_github_repos" {
  type        = map(list(string))
  description = "A map of GitHub repos and their associated Vault policies"
}