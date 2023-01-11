module "public_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-BastionInstance"

  ami                    = data.aws_ami.amznlinux2.id
  instance_type          = var.instance_type["Prd"]
  key_name               = var.keypair_name
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-BastionInstance"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}