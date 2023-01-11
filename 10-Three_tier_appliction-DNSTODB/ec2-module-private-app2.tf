module "private_app2_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-App2Instance-${count.index}"
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 1)
  count = var.instance_count
  user_data = file("${path.module}/userdata-app2.sh")

  tags = {
    Name  = "${local.owner}-${local.division}-${local.environment}-App2Instance-${count.index}"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}