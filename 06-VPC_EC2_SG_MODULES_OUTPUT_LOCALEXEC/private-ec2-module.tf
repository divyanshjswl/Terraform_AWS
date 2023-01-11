module "private_ec2_instance" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.1.4"

  name          = "${local.owner}-${local.division}-${local.environment}-Private-instance"
  ami           = data.aws_ami.amznlinux2.id
  instance_type = var.instance_type["prd"]
  /*
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  */
  subnet_id              = element(module.vpc.private_subnets, 1) //this is the new function we use, as "subnet_ids" is retired now
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  #instance_count         = var.private_instance_count
  count     = var.private_instance_count
  key_name  = var.instance_keyname
  user_data = file("${path.module}/userdata.sh")
  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-Private-instance"
    Environment = "${local.environment}"
  }
}