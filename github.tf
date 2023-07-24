#
# JWT auth method for GitHub repos
#
resource "vault_jwt_auth_backend" "github" {
  description        = "GitHub JWT authentication method"
  path               = "jwt"
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  bound_issuer       = "https://token.actions.githubusercontent.com"
}

resource "vault_jwt_auth_backend_role" "github_repos" {
  for_each       = var.github_repos
  backend        = vault_jwt_auth_backend.github.path
  role_name      = "actions-runner-role-${md5(each.key)}"
  token_policies = flatten([vault_policy.default_policy.name, [for p in each.value.secrets : format("github-repo-to-secrets-policy-%s", p)]])
  bound_claims = {
    repository = each.key
  }
  bound_claims_type = "string"
  user_claim        = "sub"
  role_type         = "jwt"
}

resource "vault_policy" "github_repo_to_secrets" {
  for_each = toset(distinct(flatten([for k, v in var.github_repos : v.secrets])))
  name     = "github-repo-to-secrets-policy-${each.value}"
  policy   = <<-EOT
    path "${each.value}" {
      capabilities = ["read"]
    }
  EOT
}
