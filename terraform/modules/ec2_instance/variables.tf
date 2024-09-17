# modules/ec2_instance/variables.tf
variable "key_name" {
  description = "Name of the SSH key pair for EC2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}
