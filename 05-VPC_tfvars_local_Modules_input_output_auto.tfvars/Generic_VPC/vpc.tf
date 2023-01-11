module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = "Terraform-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #Database subnet
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
  create_database_subnet_route_table = true
  create_database_subnet_group       = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name = "Public_subnet"
  }
  private_subnet_tags = {
    Name = "Private_subnet"
  }
  database_subnet_tags = {
    Name = "Database_subnet"
  }
  vpc_tags = {
    Name = "terraform-vpc"
  }

  tags = {
    Owner       = "Divyansh"
    Environment = "Prod"
  }

}