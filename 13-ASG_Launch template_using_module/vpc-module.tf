module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = "${local.owner}-${local.division}-${local.environment}-VPC"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  #database section
  database_subnets                   = var.database_subnets
  create_database_subnet_route_table = var.create_database_subnet_route_table
  create_database_subnet_group       = var.create_database_subnet_group

  private_subnet_tags = {
    Type = "Private Subnet"
  }
  public_subnet_tags = {
    Type = "Public Subnet"
  }
  database_subnet_tags = {
    Type = "Database Subnet"
  }
  vpc_tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-VPC"
    Division    = "${local.division}"
    Environment = "${local.environment}"
    Owner       = "${local.owner}"
  }

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-VPC"
    Owner       = "${local.owner}"
    Division    = "${local.division}"
    Environment = "${local.environment}"
  }
}
