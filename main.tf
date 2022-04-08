terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
}

# Create a VPC
resource "aws_vpc" "michael" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "michael-vpc"
  }
}

###### subnet_web #####
resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.michael.id
  cidr_block = "192.168.0.0/27"

  tags = {
    Name = "michael-subnet_web"
  }
}

###### subnet_app #####
resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.michael.id
  cidr_block = "192.168.0.32/27"

  tags = {
    Name = "michael-subnet_app"
  }
}

###### subnet_db #####
resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.michael.id
  cidr_block = "192.168.0.64/28"

  tags = {
    Name = "michael-subnet_db"
  }
}