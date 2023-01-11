module "public_ec2_instance" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.1.4"

  name                   = "${local.owner}-${local.division}-${local.environment}-Public-instance"
  ami                    = data.aws_ami.amznlinux2.id
  instance_type          = var.instance_type["prd"]
  key_name               = var.instance_keyname
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  tags = {
    Name     = "${local.owner}-${local.division}-${local.environment}-Public-instance"
    Division = "${local.division}"
  }
}