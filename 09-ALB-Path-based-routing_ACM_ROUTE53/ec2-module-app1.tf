module "app1_private_ec2_instance" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-App1Instance-${count.index}"

  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type["Stg"]
  key_name               = var.keypair_name
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 1)
  count = var.private_instance_count
  user_data = file("${path.module}/userdata-app1.sh")

  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-App1Instance-${count.index}"
    Division = "${local.division}"
    Owner = "${local.owner}"
    Environment = "${local.environment}"
  }
}