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

variable "azs" {
  description = "The set of AZs in the region where the app will run"
  type = list(string)
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}
