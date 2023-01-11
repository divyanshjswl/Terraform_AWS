resource "aws_autoscaling_group" "terraform_asg" {
    name_prefix = "myasg-"
    desired_capacity = 2
    max_size = 10
    min_size = 2
    vpc_zone_identifier = module.vpc.private_subnets
    target_group_arns = [module.alb.target_group_arns]
    health_check_type = "Ec2"
    launch_template {
      id = aws_launch_template.terraform_launchtemplate.id
      version = aws_launch_template.terraform_launchtemplate.latest_version
    }
  # Instance Refresh
  instance_refresh {
    strategy = "Rolling"
    preferences {
      # instance_warmup = 300 # Default behavior is to use the Auto Scaling Groups health check grace period value
      min_healthy_percentage = 50            
    }
    triggers = [ "desired_capacity" ] # You can add any argument from ASG here, if those has changes, ASG Instance Refresh will trigger   
  }
  tag {
    key                 = "Owners"
    value               = "Web-Team"
    propagate_at_launch = true
  }
}