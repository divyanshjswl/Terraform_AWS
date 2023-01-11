module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "3.0.1"
  name    = "${local.owner}-${local.division}-${local.environment}-ClassicLB"

  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [module.lb_security_group.security_group_id]
  internal        = false

  listener = [
    {
      instance_port     = var.instance_port
      instance_protocol = var.instance_protocol
      lb_port           = var.lb_port
      lb_protocol       = var.lb_protocol
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  // ELB attachments
  number_of_instances = var.private_instance_count
  instances           = [module.private_ec2_instance[0].id, module.private_ec2_instance[1].id]

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-ClassicLB"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}