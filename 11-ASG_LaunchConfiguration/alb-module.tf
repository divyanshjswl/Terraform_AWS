module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "7.0.0"

  name = "${local.owner}-${local.division}-${local.environment}-ALB"

  load_balancer_type = var.load_balancer_type

  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets]
  security_groups = [module.alb_security_group.security_group_id]

  # Target group index 0 - App1 TG
  target_groups = [
    {
      name_prefix          = "app-1"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      /*targets = {
        my_ec2 = {
          target_id = aws_instance.this.id
          port      = 80
        },
        my_ec2_again = {
          target_id = aws_instance.this.id
          port      = 8080
        }
      }
      tags = {
        InstanceTargetGroupTag = "baz"
      }*/
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  #HTTPS listner index 0 
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    }
  ]
  https_listener_rules = [
    {
      https_listener_index = 0

      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [{
        path_patterns = ["/*"]
      }]
    }
  ]

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-ALB"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
    Cost_center = "${local.cost_center}"
  }
}