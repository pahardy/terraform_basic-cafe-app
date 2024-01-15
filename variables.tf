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

