module "public_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "4.13.0"
  name        = "${local.owner}-${local.division}-${local.environment}-Public-SG"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.publicsg_allowed_cidr
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-Public-SG"
    Environment = local.environment
    Division    = local.division
  }
}