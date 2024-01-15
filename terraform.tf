#terraform block
terraform {
  required_version = "~> 1.1" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Provider block
provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "ec2demo" {
  ami           = "ami-0a2e7efb4257c0907"
  instance_type = "t2.micro"
  user_data = file("app1-install.sh")
  tags = {
    "Name" = "TerraformEC2Demo"
  }
}

#Creating variables
variable "region" {
  description = "The region in which to place the EC2 instances"
  type = string
  default = "ca-central-1"
}

variable "instance-type" {
  description = "The desired instance type for the app"
  type = string
  default = "t2.micro"
}

variable "ami" {
  description = "The desired AMI for the app"
  type = string
  default = "ami-0a2e7efb4257c0907"
}

variable "security-group" {
  description = "The SecurityGroup that will allow HTTP traffic to the app"
  type = set(string)
  default = ["Allow-HTTP-SG"]
}