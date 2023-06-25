github_secret_mount_path = "github"

github_repo_to_secret_paths = {
  "tenzin-io/actions-runner-images" = ["artifactory/tenzin-bot"],
  "tenzin-io/cloudflare-dns"        = ["cloudflare"],
  "tenzin-io/homelab-k8s-v1"        = ["cloudflare", "tailscale", "github_app", "homelab-k8s-v1"]
  "tenzin-io/homelab-k8s-nvidia"    = ["cloudflare", "github_app", "homelab-k8s-nvidia"]
  "tenzin-io/homelab-k8s-oracle"    = ["cloudflare", "github_app", "homelab-k8s-oracle"]
}
