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

resource "aws_instance" "instance" {
    ami="ami-04df9ee4d3dfde202"
    instance_type = "t2.micro"
  
}