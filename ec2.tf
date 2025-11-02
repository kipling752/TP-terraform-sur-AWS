terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.14.0"
        }
    }
  required_version = "1.9.4"
}

provider "aws" {
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}


resource "aws_instance" "name" {
    ami = "ami-0c398cb65a93047f2"
    instance_type = "t3.micro"
    key_name = "devops-systoker"
    tags = {
        Name = "systoker-instance"
    }
}