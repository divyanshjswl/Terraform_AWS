module "bastion_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.owner}-${local.division}-${local.environment}-BastionInstnace"

  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type["Prd"]
  key_name               = var.key_name
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  user_data = file("${path.module}/userdata-bastion.sh") //To install mysql client on the server 

  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-BastionInstnace"
    Owneer = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}