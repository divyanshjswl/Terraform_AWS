resource "aws_launch_template" "terraform_launchtemplate" {
  name   = "my-launch-template"
  description = "My launch template"
  image_id      = data.aws_ami.amazonlinux2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  user_data = filebase64("${path.module}/userdata-app1.sh")
  ebs_optimized = true
  update_default_version = var.update_default_version
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      #volume_size = 10      
      volume_size = 20             
      delete_on_termination = true
      volume_type = "gp2" # default  is gp2 
    }
   }
  monitoring {
    enabled = true
  }   
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasg"
    }
  }  
}
