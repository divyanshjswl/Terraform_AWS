module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"
  name    = "${local.owner}-${local.division}-${local.environment}-terraform-VPC"
  cidr    = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  #Database setting
  database_subnets                   = var.database_subnets
  create_database_subnet_route_table = var.create_database_subnet_route_table
  create_database_subnet_group       = var.create_database_subnet_group

  public_subnet_tags = {
    Type = "Public Subnet"
  }

  private_subnet_tags = {
    Type = "Private Subnet"
  }

  database_subnet_tags = {
    Type = "Database Subnet"
  }

  vpc_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-terraform-VPC"
  }

  tags = {
    Name        = "${local.owner}-${local.division}-${local.environment}-terraform-VPC"
    Owner       = "${local.owner}"
    Environment = "${local.environment}"
  }
}