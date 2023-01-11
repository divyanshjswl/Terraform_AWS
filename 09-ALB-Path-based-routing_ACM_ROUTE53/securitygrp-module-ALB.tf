module "ALB_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-ALBSG"
  description = "Allow port HTTP and HTTPS from everywhere"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = var.alb_sg_ingress_cidr_blocks
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow HTTP port from internet"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Allow HTTPS port from internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-ALBSG"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}