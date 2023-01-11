module "public_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-PublicSG"
  description = "Allow ssh from anywhere"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_rules            = ["ssh-tcp"]
  egress_rules             = ["all-all"]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-PublicSG"
    Owner = "${local.oner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}