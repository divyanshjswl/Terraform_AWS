module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = "${local.owner}-${local.division}-${local.environment}-terraform-VPC"
  cidr = var.vpc_cidr_range

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnet
  public_subnets  = var.vpc_public_subnet

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  database_subnets                   = var.database_subnet
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table

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
    owner = "${local.owner}"
    Name  = "${local.owner}-${local.division}-${local.environment}-terraform-VPC"
  }

  tags = {
    owner       = "${local.owner}"
    Environment = "${local.environment}"
    Division    = "${local.division}"
  }
}