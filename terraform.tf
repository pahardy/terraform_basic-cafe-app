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



