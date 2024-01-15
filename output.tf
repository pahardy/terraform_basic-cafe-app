#Output the instance public IP address once it's been created
output "cafe-app-public-ip" {
  value = aws_instance.my-cafe-demo.public_ip
}