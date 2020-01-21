provider "aws" {
  region  = "eu-central-1"
  version = ">= 2.38.0"
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "canelkatmis"
    workspaces {
      name = "eks-demo"
    }
  }
}
