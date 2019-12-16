# Remote Backend Configuration:
terraform {
  required_version = ">= 0.11.0"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pphan"
    workspaces {
      name = "dns-multicloud"
    }
  }
}