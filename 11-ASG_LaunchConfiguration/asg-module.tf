module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "2.0.0"


  name             = "${local.environment}-${local.division}-${local.environment}-ASG"
  #user_name_prefix = false

  # Launch configuration
  #
  # launch_configuration = "my-existing-launch-configuration" # Use the existing launch configuration
  # create_lc = false # disables creation of launch configuration

  # Auto scaling group
  asg_name                  = "${local.environment}-${local.division}-${local.environment}-ASG"
  vpc_zone_identifier       = [module.vpc.public_subnets]
  health_check_type         = "EC2"
  min_size                  = 2
  max_size                  = 10
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      delete_on_termination = true
      encrypted             = true
      volume_type           = "gp2"
      volume_size           = "20"
    },
  ]

  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = true
      volume_size           = "15"
      volume_type           = "gp2"
    },
  ]
/*
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "optional" # At production grade you can change to "required", for our example if is optional we can get the content in metadata.html
    http_put_response_hop_limit = 32
  }
*/
  # Launch Configuration setting
  lc_name   = "${local.environment}-${local.division}-${local.environment}-LaunchConfiguration"
  #use_lc    = true
  create_lc = true

  image_id          = data.aws_ami.amazonlinux2.id
  instance_type     = var.instance_type["Prd"]
  key_name          = var.key_name
  user_data         = file("${path.module}/userdata-app1.sh")
  ebs_optimized     = true
  enable_monitoring = true

  security_groups             = [module.private_security_group.security_group_id]
  associate_public_ip_address = false

  # Add Spot Instances, which creates Spot Requests to get instances at the price listed (Optional argument)
  spot_price = "0.014"
  #spot_price        = "0.016" # Change for Instance Refresh test


  tags = [
    {
      key                 = "Environment"
      value               = "Prd"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "Divyansh_Personal"
      propagate_at_launch = true
    },
    {
      Name     = "${loca.name}-${local.division}-${local.environment}-ASGLC"
      Owner    = "${local.owner}"
      Division = "${local.division}"
    }
  ]
}

