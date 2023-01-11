module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
  description = "Allow port 22 and 80 443 from VPC CIDR"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.vpc_cidr_block
  ingress_rules       = ["https-443-tcp", "http-80-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
    Onwe        = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}