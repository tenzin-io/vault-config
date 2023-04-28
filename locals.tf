locals {
  allowed_github_repos = {
    "actions-runner" = {
      claim          = "repo:tenzin-io/actions-runner:ref:refs/heads/main"
      token_policies = [vault_policy.read_secrets.name]
    }
    "cloudflare-dns" = {
      claim          = "repo:tenzin-io/cloudflare-dns:ref:refs/heads/main"
      token_policies = [vault_policy.read_secrets.name]
    }
    "homelab-k8s-nvidia" = {
      claim          = "repo:tenzin-io/homelab-k8s-nvidia:ref:refs/heads/main"
      token_policies = [vault_policy.read_secrets.name]
    }
  }
}
