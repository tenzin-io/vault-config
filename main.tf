terraform {
  backend "s3" {
    bucket         = "tenzin-io"
    key            = "terraform/homelab-vault.state"
    dynamodb_table = "tenzin-io"
    region         = "us-east-1"
  }
}

provider "vault" {
  address = "https://vault.tenzin.io"
}

resource "vault_policy" "default_policy" {
  name   = "default-policy"
  policy = data.vault_policy_document.default_policy.hcl
}

data "vault_policy_document" "default_policy" {
  rule {
    path         = "auth/token/create"
    capabilities = ["create", "read", "update", "list"]
  }
}
