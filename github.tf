#
# Secrets store for GitHub repos 
#
resource "vault_mount" "github" {
  path        = var.github_secret_mount_path
  type        = "kv"
  options     = { version = "2" }
  description = "Secret store for GitHub repositories"
}

resource "vault_kv_secret_backend_v2" "github" {
  mount        = vault_mount.github.path
  max_versions = 15
  cas_required = false
}

resource "vault_policy" "github" {
  for_each = toset(flatten([for k, v in var.github_repo_to_secret_paths : v]))
  name     = "github-policy-${each.value}"
  policy = templatefile("${path.module}/files/github_secrets_policy.hcl", {
    mount_path  = vault_mount.github.path
    secret_path = each.value
  })
}

#
# JWT auth method for GitHub repos
#
resource "vault_jwt_auth_backend" "github" {
  description        = "GitHub JWT authentication method"
  path               = "jwt"
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  bound_issuer       = "https://token.actions.githubusercontent.com"
}

resource "vault_jwt_auth_backend_role" "github_actions" {
  for_each       = var.github_repo_to_secret_paths
  backend        = vault_jwt_auth_backend.github.path
  role_name      = "actions-runner-role-${md5(each.key)}"
  token_policies = [for p in each.value : format("github-policy-%s", p)]
  bound_claims = {
    repository = each.key
  }
  bound_claims_type = "string"
  user_claim        = "sub"
  role_type         = "jwt"
}
