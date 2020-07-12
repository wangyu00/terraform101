resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_linux.id
  instance_type = var.instance_type

  security_groups = [aws_security_group.allow_tls.id]

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

