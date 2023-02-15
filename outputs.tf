output "instance_id" {
  description = "ID of our instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP addres from our instance"
  value       = aws_instance.app_server.public_ip
}
