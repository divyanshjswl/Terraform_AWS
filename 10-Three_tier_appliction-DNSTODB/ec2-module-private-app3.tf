module "private_app3_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-App3Instance-${count.index}"

  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)
  count = var.instance_count
  user_data = templatefile("userdata-app3-setting.tmpl",{rds_db_endpoint = module.rds.db_instance_address})

  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-App3Instance-${count.index}"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}