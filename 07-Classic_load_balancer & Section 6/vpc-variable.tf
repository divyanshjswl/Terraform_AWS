variable "vpc_cidr" {
  description = "Please define the VPC CIDR range here"
  type        = string
}

variable "vpc_azs" {
  description = "This is to define VPC AZs"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "Please define VPC private subnet"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "Please define VPC public subnets here"
  type        = list(string)
}

variable "database_subnets" {
  description = "Please define Database subnets here"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Please put true if required"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Please put true if required"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Please put true if required"
  type        = bool
}

variable "enable_dns_support" {
  description = "Please put true if required"
  type        = bool
}

variable "create_database_subnet_route_table" {
  description = "Please put true if required"
  type        = bool
}

variable "create_database_subnet_group" {
  description = "Please put true if required"
  type        = bool
}