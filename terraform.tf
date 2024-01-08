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
