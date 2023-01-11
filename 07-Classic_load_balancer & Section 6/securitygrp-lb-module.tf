module "lb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-LBSG"
  description = "Allow listner port 80 and 81 from everywhere"
  vpc_id      = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 81
      protocol    = 6
      description = "Allow listner ports from everywhere"
      cidr_blocks = var.lbsg_inbound_cidrblock
    }
  ]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-LBSG"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}