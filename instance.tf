#Creating the AWS instances to run the app
resource "aws_instance" "cafe-app-instance" {
  ami           = var.ami
  instance_type = var.instance-type
  user_data = file("app1-install.sh")
  security_groups = var.security-group
  for_each = toset(var.azs)
  tags = {
    "Name" = "${each.key}-BasicCafeApp-Terraform"
  }
}