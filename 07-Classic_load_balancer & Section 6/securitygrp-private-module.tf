module "private_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.13.0"
  name                = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
  description         = "Allow inbound ssh and http from vpc CIDR"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  egress_rules        = ["all-all"]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
    Owner       = "${local.owner}"
    Cost_center = "${local.cost_center}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}