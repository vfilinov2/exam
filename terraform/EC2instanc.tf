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
  version = "~> 2.0"
}

resource "aws_instance" "build" {
   ami           = "ami-08962a4068733a2b6"
   instance_type = "t2.micro"
 }