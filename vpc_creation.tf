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

# step1: Create Vpc 
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags={
    Name="vpc01"
  }
}

#step2: create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id =aws_vpc.myvpc.id 
  cidr_block = "10.0.1.0/24"

}

#step3: Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id =aws_vpc.myvpc.id 
  cidr_block = "10.0.2.0/24"

}

#step4: create Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

#step5: route table for public subnet

resource "aws_route_table" "publicRt" {
   vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#step 6: Route table association public subnet
resource "aws_route_table_association" "publicRtassociation" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.publicRt.id
  
}