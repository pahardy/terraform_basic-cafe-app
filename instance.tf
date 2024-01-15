#Create the SecurityGroup to allow HTTP access to the app
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

#Create the EC2 instance that will host the app
resource "aws_instance" "my-cafe-demo" {
  ami           = "ami-0a2e7efb4257c0907"
  instance_type = "t2.micro"
  user_data = file("app1-install.sh")
  security_groups = [aws_security_group.cafe-demo-SG-http.name]
  tags = {
    "Name" = "TerraformEC2Demo"
  }
}