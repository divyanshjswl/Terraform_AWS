module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws//examples/complete"
  version = "2.17.0"

  name = "${var.environment}-ec2-instance"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.instance_key
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group
  tags = {
    name = "${var.environment}-Server"
    business_division = "${var.business_division}"
    environment = var.environment
  }
}