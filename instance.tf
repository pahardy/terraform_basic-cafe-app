resource "aws_security_group" "cafe-demo-SG-http" {
  name = "Allow-HTTP-Cafe-Demo-SG"
  description = "Allows HTTP traffic to the EC2 instance hosting the demo cafe app"

  ingress {
    description = "Allowed ingress traffic, port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allowing all egress traffic from SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Creating the AWS instances to run the app
resource "aws_instance" "cafe-app-instance" {
  ami           = var.ami
  instance_type = var.instance-type
  user_data = file("app1-install.sh")
  security_groups = [aws_security_group.cafe-demo-SG-http.name]
  for_each = toset(var.azs)
  tags = {
    "Name" = "${each.key}-BasicCafeApp-Terraform"
  }
}
