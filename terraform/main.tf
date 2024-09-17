# main.tf
module "ec2_instance" {
  source = "./modules/ec2_instance"
  key_name      = var.key_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
