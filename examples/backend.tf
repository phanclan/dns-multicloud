# Remote Backend Configuration:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pphan"
    workspaces {
      name = "dns_multicloud"
    }
  }
}