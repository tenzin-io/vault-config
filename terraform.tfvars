github_secret_mount_path = "github"

github_repo_to_secret_paths = {
  "tenzin-io/actions-runner-images"       = ["artifactory"],
  "tenzin-io/ubuntu-actions-runner-image" = ["artifactory"],
  "tenzin-io/nvidia-actions-runner-image" = ["artifactory"],
  "tenzin-io/cloudflare-dns"              = ["cloudflare"],
  "tenzin-io/homelab-k8s-nvidia"          = ["cloudflare"]
}
