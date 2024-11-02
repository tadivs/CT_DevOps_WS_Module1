terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Hercules" {
  ami           = data.ami-09c813fb71547fc4f
  instance_type = "t2.micro" 
  
}

data "aws_ami" "RedHat" {
  most_recent = true

  filter {
    name   = "Hercules"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

