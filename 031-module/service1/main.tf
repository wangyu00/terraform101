terraform {
  required_version = "~> 0.12.25"

  required_providers {
    aws    = "~> 2.45"
  }

  backend "s3" {
    bucket         = "xiaopo-terraform-state"
    key            = "xiaopo_web.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "xiaopo-terraform-state-lock"
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  profile    = "devops_tw"
}

module "ec2_for_xiaopo_service_1" {
  source = "../module-ec2"

  instance_type = "t2.micro"
}

