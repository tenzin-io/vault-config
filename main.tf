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
