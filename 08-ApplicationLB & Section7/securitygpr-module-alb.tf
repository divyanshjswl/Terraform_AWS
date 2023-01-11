module "ALB_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-ALBSG"
  description = "Allow port 80 and 81 inbound traffic from internet"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow inbond traffic for port 80 from everywhere"
      cidr_blocks = var.everywhere_CIDR
    },
    {
      from_port   = 81
      to_port     = 81
      protocol    = "tcp"
      description = "Allow inbound traffic for port 81 from everywhere"
      cidr_blocks = var.everywhere_CIDR
    }
  ]
  egress_rules = ["all-all"]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-ALBSG"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}