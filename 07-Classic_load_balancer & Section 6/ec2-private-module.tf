module "private_ec2_instance" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-PrivateInstance-${count.index}"

  ami                    = data.aws_ami.amznlinux2.id
  instance_type          = var.instance_type["prd"]
  key_name               = var.key_name
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 1)
  count                  = var.private_instance_count
  user_data              = file("${path.module}/userdata.sh")

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-PrivateInstance-${count.index}"
    Division    = "${local.division}"
    Owner       = "${local.owner}"
    Environment = "${local.environment}"
  }
}