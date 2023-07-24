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
  for_each  = var.github_repos
  backend   = vault_jwt_auth_backend.github.path
  role_name = "actions-runner-role-${md5(each.key)}"
  token_policies = flatten([
    vault_policy.default_policy.name,
    [for p in each.value.secrets : format("github-repo-to-secret-policy-%s", p)],
    [for s in each.value.ssh_users : format("github-repo-to-ssh-user-policy-%s", s)],
  ])
  bound_claims = {
    repository = each.key
  }
  bound_claims_type = "string"
  user_claim        = "sub"
  role_type         = "jwt"
}

resource "vault_policy" "github_repo_to_secret" {
  for_each = toset(distinct(compact(flatten([for k, v in var.github_repos : v.secrets]))))
  name     = "github-repo-to-secret-policy-${each.value}"
  policy   = <<-EOT
    path "${each.value}" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "github_repo_to_ssh_users" {
  for_each = toset(distinct(compact(flatten([for k, v in var.github_repos : v.ssh_users]))))
  name     = "github-repo-to-ssh-user-policy-${each.value}"
  policy   = <<-EOT
    path "${vault_mount.ssh.path}/sign/${each.value}-role" {
      capabilities = ["create", "update"]
    }
  EOT
}
