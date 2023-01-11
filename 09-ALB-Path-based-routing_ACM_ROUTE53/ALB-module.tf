module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "7.0.0"

  name = "${local.owner}-${local.division}-${local.environment}-ApplicationLB"

  load_balancer_type = var.load_balancer_type

  vpc_id             = module.vpc.vpc_id
  subnets            = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups    = [module.ALB_security_group.security_group_id]

#HTTP listner redirecting trafic to port 443(Permanent re-direct)
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
# App1 Trget group - terget group index 0
  app1_target_groups = [
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = var.targetgroup_target_type
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
      targets = {
        app1_instance_1 = {
          target_id = module.app1_private_ec2_instance.id[0]
          port      = 80
        }
        app1_instance_2 = {
          target_id = module.app1_private_ec2_instance.id[1]
          port      = 80
        }
      }
      tags = {
        Name = "${local.owner}-${local.division}-${local.environment}-APP1-TG"
        Owner = "${local.owner}"
        Division = "${local.division}"
        Environment = "${local.environment}"
      }
    }

  ]
# App2 Trget group - terget group index 1
  app2_target_groups = [
    {
      name_prefix          = "app2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = var.targetgroup_target_type
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        app2_ec2_1 = {
          target_id = module.app2_private_ec2_instance.id[0]
          port      = 80
        }
        app2_ec2_2 = {
          target_id = module.app2_private_ec2_instance.id[1]
          port      = 80
        }
      }
      tags = {
        Name = "${local.owner}-${local.division}-${local.environment}-APP2-TG"
        Owner = "${local.owner}"
        Division = "${local.division}"
        Environment = "${local.environment}"
      }
    }
  ]
  https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "This is the Fixed response from Divyansh World, search for /app1* or /app2* for more applications"
        status_code  = "200"
      }
    }
  ]
  #HTTPS Listner Rule (Path based)
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
        path_patterns = ["/app1*"]
      }]
    },
    {
      https_listener_index = 0

      actions = [
        {
          type               = "forward"
          target_group_index = 1
        }
      ]

      conditions = [{
        path_patterns = ["/app2*"]
      }]
    }
  ]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-ApplicationLB"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}