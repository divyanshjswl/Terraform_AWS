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
  security_groups    = [module.alb_security_group.security_group_id]

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

# App-1 TG - target group index 0 
  app_1_target_groups = [
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
      targets = {
        app1_ec2_1 = {
          target_id = module.private_app1_ec2_instance.id[0]
          port      = 80
        },
        app1_ec2_2 = {
          target_id = module.private_app1_ec2_instance.id[1]
          port      = 80
        }
      }
      tags = {
        Name = "${local.owner}-${local.division}-${local.environment}-App1-TG"
      }
    }
  ]
# App-2 TG - target group index 1
  app2_target_groups = [
    {
      name_prefix          = "app2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
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
          target_id = module.private_app2_ec2_instance.id[0]
          port      = 80
        },
        app2_ec2_2 = {
          target_id = module.private_app2_ec2_instance.id[1]
          port      = 80
        }
      }
      tags = {
        Name = "${local.owner}-${local.division}-${local.environment}-App2-TG"
      }
    }
  ]
# App-3 TG - target group index 2
  app3_target_groups = [
    {
      name_prefix          = "app3-"
      backend_protocol     = "HTTP"
      backend_port         = 8080
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/login"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        app3_ec2_1 = {
          target_id = module.private_app3_ec2_instance.id[0]
          port      = 8080
        },
        app3_ec2_2 = {
          target_id = module.private_app3_ec2_instance.id[1]
          port      = 8080
        }
      }
      tags = {
        Name = "${local.owner}-${local.division}-${local.environment}-App3-TG"
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "This is a Fixed response coming from Application load balancer, for more applicaltio search with /app1*, /app2*, /*"
        status_code  = "200"
      }
    }
  ]
  https_listener_rules = [
    {
      https_listener_index = 0
      priority = 1

      actions = [
        {
          type               = "forward"
          target_group_index = 0 //for app1 tg
        }
      ]

      conditions = [{
        path_patterns = ["/app1*"]
      }]
    },
    {
      https_listener_index = 0
      priority = 2

      actions = [
        {
          type               = "forward"
          target_group_index = 1 //for app2 tg
        }
      ]

      conditions = [{
        path_patterns = ["/app2*"]
      }]
    },
    {
      https_listener_index = 0
      priority = 3

      actions = [
        {
          type               = "forward"
          target_group_index = 2 //for app2 tg
        }
      ]

      conditions = [{
        path_patterns = ["/*"]
      }]
    }
  ]
  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-ApplicationLB"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environemnt = "${local.environment}"
    Cost_center = "${local.cost_center}"
  }
}