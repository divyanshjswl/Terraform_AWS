module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
  description = "Allow 80 and 443 and ssh from vpc CIDR"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = module.vpc.vpc_cidr_block
  ingress_rules            = ["ssh-tcp", "https-443-tcp", "http-80-tcp"]
  egress_rules             = ["all-all"]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
    Owner = "${local.oner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}