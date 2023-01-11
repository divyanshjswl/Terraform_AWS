module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.0.0"

  name = "${local.owner}-${local.division}-${local.environment}-ALB"

  load_balancer_type = var.load_balancer_type

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [module.public_security_group.security_group_id]


#http listner index 0
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

#Target group index 0 
  target_groups = [
    {
      name_prefix          = "app1-"
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
    /*
      targets = {
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
      }
    */
    }
  ]
#https listener index 0
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      fixed_response = {
        content_type = "text/plain"
        message_body = "This is Fixed response from Divyansh terraform world"
        status_code  = "200"
      }
    }
  ]
# HTTPS listner rule
  https_listener_rules = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [{
        path_patterns = ["/*"]
      }]
  tags = {
    Environment = "${local.environment}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}
