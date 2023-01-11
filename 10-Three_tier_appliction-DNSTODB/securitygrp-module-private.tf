module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
  description = "Allow port 80 and 443 from VPC CIDR range"
  vpc_id      = "vpc-12345678"

  ingress_cidr_blocks      = [module.vpc.vpc_cidr_block]
  ingress_rules            = ["http-80-tcp", "ssh-tcp"]
    ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = 6
      description = "Allow HTTP port from VPC CIDR"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  egress_rules = ["all-all"]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-PrivateSG"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"

  }
}