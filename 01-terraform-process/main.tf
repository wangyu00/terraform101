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

resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_ami" "latest_linux" {
  owners           = ["self", "amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["*amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

