module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = "${local.name}-terraform-vpc"
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  public_subnet_tags = {
    Type = "Public subnets"
  }

  private_subnet_tags = {
    Type = "Private subnets"
  }

  database_subnet_tags = {
    Type = "Database subnets"
  }

  vpc_tags = {
    Name = "${local.name}-terraform-vpc"
  }

  tags = {
    Owner       = local.owner
    Environment = local.environment
    Division    = local.division
  }

}