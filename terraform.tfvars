
github_repos = {
  "tenzin-io/ansible-setup-homelab" = {
    ssh_users = ["sysuser"]
    secrets   = ["secrets/data/kubeconfig/homelab-k8s-dev"]
  }
  "tenzin-io/actions-runner-images" = {
    secrets = ["secrets/data/artifactory/tenzin-bot"]
  }
  "tenzin-io/cloudflare-dns" = {
    secrets = ["secrets/data/cloudflare"]
  }
  "tenzin-io/homelab-artifactory" = {
    secrets   = ["secrets/data/artifactory/admin"]
    ssh_users = ["root"]
  }
  "tenzin-io/homelab-k8s-v1" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/tailscale", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-v1"]
  }
  "tenzin-io/homelab-k8s-nvidia" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-nvidia"]
  }
  "tenzin-io/homelab-k8s-oracle" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-oracle"]
  }
  "tenzin-io/homelab-k8s-dev" = {
    secrets = ["secrets/data/cloudflare", "secrets/data/github_app", "secrets/data/kubeconfig/homelab-k8s-dev", "secrets/data/xmatters", "secrets/data/grafana"]
  }
}
