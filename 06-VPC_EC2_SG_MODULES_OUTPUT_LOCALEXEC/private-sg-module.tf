module "private_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.13.0"
  name                = "${local.owner}-${local.division}-${local.environment}-Private-SG"
  description         = "Allow inbound ssh and http from VPC CIDR"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-Private-SG"
    Environment = local.environment
    Division    = local.division
  }
}