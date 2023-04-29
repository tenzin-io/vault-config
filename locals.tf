locals {
  allowed_github_repos = {
    "ubuntu-actions-runner-image" = {
      claims = {
        "repository" = "tenzin-io/ubuntu-actions-runner-image"
      }
      token_policies = [vault_policy.read_secrets.name]
    }
    "nvidia-actions-runner-image" = {
      claims = {
        "repository" = "tenzin-io/nvidia-actions-runner-image"
      }
      token_policies = [vault_policy.read_secrets.name]
    }
    "cloudflare-dns" = {
      claims = {
        "sub" = "repo:tenzin-io/cloudflare-dns:ref:refs/heads/main"
      }
      token_policies = [vault_policy.read_secrets.name]
    }
    "homelab-k8s-nvidia" = {
      claims = {
        sub = "repo:tenzin-io/homelab-k8s-nvidia:ref:refs/heads/main"
      }
      token_policies = [vault_policy.read_secrets.name]
    }
  }
}
