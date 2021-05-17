terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "build" {
   count         = 2
   name  = lookup(var.name-instance, count.index + 1) 
   ami           = "ami-08962a4068733a2b6"
   instance_type = "t2.micro"
   key_name      = "aws_key"
  
    tags = {
    name  = lookup(var.name-instance, count.index + 1)
  }
 }