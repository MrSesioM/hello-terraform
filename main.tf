terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b752bf1df193a6c4"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0133c61a0a52088e4"
  key_name      = "lucatic_key"
  vpc_security_group_ids = [
    "sg-01026b2bbaa8626e7",
  ]

  user_data = file("apache.sh")

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/lucatic_key.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "./public_html/"
    destination = "/tmp/"
    on_failure  = fail
  }

  tags = {
    Name = var.instance_name
    APP  = "vue2048"
  }
}
