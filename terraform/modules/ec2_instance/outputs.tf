# modules/ec2_instance/outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.public_instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.public_instance.public_ip
}

output "key_name" {
  description = "The name of the SSH key pair"
  value       = aws_key_pair.key_pair.key_name
}
