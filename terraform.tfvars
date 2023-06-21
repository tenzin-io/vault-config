allowed_github_repos = [
  {
    secret_paths = ["artifactory"],
    claims = {
      "repository" = "tenzin-io/ubuntu-actions-runner-image"
    }
  },
  {
    secret_paths = ["artifactory"],
    claims = {
      "repository" = "tenzin-io/nvidia-actions-runner-image"
    }
  },
  {
    secret_paths = ["cloudflare"],
    claims = {
      "repository" = "tenzin-io/cloudflare-dns"
    }
  },
  {
    secret_paths = ["cloudflare"],
    claims = {
      "repository" = "tenzin-io/homelab-k8s-nvidia"
    }
  }
]
