variable "vpc_cidr" {
    description = "Please provide VPC CIDR block here"
    type = string
}

variable "vpc_azs" {
    description = "Please provide VPC AZs here"
    type = list(string)
}

variable "private_subnets" {
    description = "Please provide Private subnet CIDR range here"
    type = list(string)
}

variable "public_subnets" {
    description = "Please provide Public subnet CIDR range here"
    type = list(string)
}

variable "enable_nat_gateway" {
    description = "Please put true if it is required"
    type = bool
}

variable "single_nat_gateway" {
    description = "Please put true if it is required"
    type = bool
}

variable "enable_dns_hostnames" {
    description = "Please put true if it is required"
    type = bool
}

variable "enable_dns_support" {
    description = "Please put true if it is required"
    type = bool
}

variable "database_subnets" {
    description = "Please provide database subnet CIDR range here"
    type = list(string)
}

variable "create_database_subnet_route_table" {
    description = "Please put true if it is required"
    type = bool
}

variable "create_database_subnet_group" {
    description = "Please put true if it is required"
    type = bool
}