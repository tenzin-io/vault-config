
github_repos = {
  "tenzin-io/ansible-setup-homelab" = {
    ssh_users = ["packer"]
    secrets = [
      "secrets/data/kubeconfig/dev-k8s",
      "secrets/data/kubeconfig/prod-k8s",
      "secrets/data/tailscale/github-actions"
    ]
  }
  "tenzin-io/actions-runner-images" = {
    secrets = ["secrets/data/artifactory/tenzin-bot"]
  }
  "tenzin-io/cloudflare-dns" = {
    secrets = ["secrets/data/cloudflare"]
  }
  "tenzin-io/homelab-k8s-prod" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/tailscale", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-prod", "secrets/data/grafana", "secrets/data/xmatters"]
  }
  "tenzin-io/homelab-k8s-nvidia" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-nvidia"]
  }
  "tenzin-io/homelab-k8s-oracle" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-oracle"]
  }
  "tenzin-io/homelab-k8s-dev" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-dev", "secrets/data/xmatters", "secrets/data/grafana-dev", "secrets/data/tailscale"]
  }
}
