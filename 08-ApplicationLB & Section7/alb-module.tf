module "alb" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/alb/aws"
  version    = "7.0.0"

  name = "${local.owner}-${local.division}-${local.environment}-ApplicationLB"

  load_balancer_type = var.load_balancer_type

  vpc_id          = module.vpc.vpc_id
  security_groups = [module.ALB_security_group.security_group_id]
  subnets         = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]



  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = var.http_listner_target_group_index
      #action_type        = "forward"
    }
  ]
  target_groups = [
    {
      name_prefix          = "Prd"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = var.target_type
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/aap1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        private_instance_1 = {
          target_id = module.private_ec2_instance[0].id
          port      = 80
        },
        private_instance_2 = {
          target_id = module.private_ec2_instance[1].id
          port      = 8080
        }
      }
      tags = {
        Name        = "${local.owner}-${local.division}-${local.environment}-TargetGroup"
        Owner       = "${local.owner}"
        Division    = "${local.division}"
        Environment = "${local.environment}"
      }
    }
  ]
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-ApplicationLB"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}