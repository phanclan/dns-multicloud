terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.49.0"
    }
    google = {
      source = "hashicorp/google"
      version = "~> 2.20.3"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
}

# AWS General Configuration
provider "aws" {
  region  = var.aws_region
}

# GCP General Configuration
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# Azure General Configuration
provider "azurerm" {
}
