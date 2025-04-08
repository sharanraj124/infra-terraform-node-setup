output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "app_url" {
  description = "URL to access the Hello World app"
  value       = "http://${aws_instance.web.public_ip}:3000"
}

