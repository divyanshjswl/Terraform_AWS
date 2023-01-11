module "public_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-PublicInstance"

  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets

  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-PublicInstance"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
    Cost_center = "${local.cost_center}"
  }
}