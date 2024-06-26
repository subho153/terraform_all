terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.os
  tags = {
    name=var.tags
  }
}