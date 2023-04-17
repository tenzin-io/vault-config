variable "auth_method_path" {
  type    = string
  default = "jwt"
}

variable "github_actions_oidc_discovery_url" {
  type    = string
  default = "https://token.actions.githubusercontent.com"
}

variable "github_actions_bound_issuer" {
  type    = string
  default = "https://token.actions.githubusercontent.com"
}

variable "allowed_github_repos" {
  type = map(object({
    claim          = string
    token_policies = list(string)
  }))
  default     = {}
  description = "A list of allowed GitHub repos via the JWT auth method."
}
