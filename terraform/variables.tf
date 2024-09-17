# variables.tf
variable "region" {
  description = "AWS region to deploy resources"
  default     = "eu-west-2"
}

variable "key_name" {
  description = "Name of the SSH key pair for EC2"
  default     = "terraform_bird"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-01ec84b284795cbc7"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.small"
}
