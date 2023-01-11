module "alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "${local.owner}-${local.division}-${local.environment}-ALBSG"
  description = "Allow port 80, 443, 8080 from internet"
  vpc_id      = "vpc-12345678"

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow port 80 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "Allow port 8080 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Allow port 443 from internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-ALBSG"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}