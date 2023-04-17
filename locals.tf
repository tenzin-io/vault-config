locals {
  allowed_github_repos = {
    "cloudflare-dns" = {
      claim          = "repo:tenzin-io/cloudflare-dns:ref:refs/heads/main"
      token_policies = [vault_policy.read_secrets.name]
    }
  }
}
