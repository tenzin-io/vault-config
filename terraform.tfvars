allowed_github_repos = [
  {
    policies = ["artifactory"],
    claims = {
      "repository" = "tenzin-io/ubuntu-actions-runner-image"
    }
  },
  {
    policies = ["artifactory"],
    claims = {
      "repository" = "tenzin-io/nvidia-actions-runner-image"
    }
  },
  {
    policies = ["cloudflare"],
    claims = {
      "repository" = "tenzin-io/cloudflare-dns"
    }
  },
  {
    policies = ["cloudflare"],
    claims = {
      "repository" = "tenzin-io/homelab-k8s-nvidia"
    }
  }
]
