variable "vpc_cidr" {
    description = "Please provide VPC CIDR range here"
    type = string
}

variable "azs" {
    description = "Please provide the List of azs here"
    type = lsit(string)
}
variable "private_subnets" {
    description = "Please provide List of private subnets here"
    type = list(string)
}
variable "public_subnets" {
    description = "Please provide the List of public subnets here"
    type = list(string)
}
variable "database_subnets" {
    description = "Please provide the List of database subnet here"
    type = list(string)
}

variable "enable_dns_hostnames" {
    description = "Please provide true if it is required"
    type = bool
}
variable "enable_dns_support" {
    description = "Please provide true if it is required"
    type = bool
}
variable "create_database_subnet_group" {
    description = "Please provide true if it is required"
    type = bool
}
variable "create_database_subnet_route_table" {
    description = "Please provide true if it is required"
    type = bool
}
variable "enable_nat_gateway" {
    description = "Please provide true if it is required"
    type = bool
}
variable "single_nat_gateway" {
    description = "Please provide true if it is required"
    type = bool
}