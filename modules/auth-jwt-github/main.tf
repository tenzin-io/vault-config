resource "vault_jwt_auth_backend" "github" {
  description        = "GitHub JWT authentication method"
  path               = var.auth_method_path
  oidc_discovery_url = var.github_actions_oidc_discovery_url
  bound_issuer       = var.github_actions_bound_issuer
}

resource "vault_jwt_auth_backend_role" "actions_runner" {
  for_each       = var.allowed_github_repos
  backend        = vault_jwt_auth_backend.github.path
  role_name      = "actions-runner-role-${each.key}"
  token_policies = each.value.token_policies
  bound_subject  = each.value.claim
  user_claim     = "sub"
  role_type      = "jwt"
}
