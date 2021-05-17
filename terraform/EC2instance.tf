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
  #name  = element(var.name_instance, count.index
  #lookup(var.name_instance, count.index + 1) 
   ami           = "ami-08962a4068733a2b6"
   instance_type = "t2.micro"
   key_name      = "aws_key"
  
    tags = {
    Name  = element(var.name_instance, count.index)
  }
 }

output "public_ip_build" { 
  value = aws_instance.build[0].public_ip 
} 
output "public_ip_prod" { 
  value = aws_instance.build[1].public_ip 
} 