terraform {
  required_version = "~> 0.12.25"

  required_providers {
    aws    = "~> 2.45"
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  profile    = "devops_tw"
}

