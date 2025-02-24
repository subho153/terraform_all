
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
  ami = "ami-05b10e"
  instance_type = "t2.micro"
  tags = {
    name="Ec2"
  }
}

terraform {
  backend "s3" {
    bucket = "terraformbucket197"
    key = "key/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table="dynamodb-state-locking"
  }
}
