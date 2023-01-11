variable "vpc_cidr_range" {
  description = "This is to define VPC CIDR range"
  type        = string
}

variable "vpc_azs" {
  description = "This is to define azs used to deploy subnets in vpc"
  type        = list(string)
}

variable "vpc_private_subnet" {
  description = "This is to define VPC private subnet"
  type        = list(string)
}

variable "vpc_public_subnet" {
  description = "This is to define VPC public subnet"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Put true if you want to enable"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Put true if you want to enable"
  type        = bool
}

variable "database_subnet" {
  description = "This is to define database subnet"
  type        = list(string)
}

variable "create_database_subnet_group" {
  description = "Put true if you want to enable"
  type        = bool
}

variable "create_database_subnet_route_table" {
  description = "Put true if you want to enable"
  type        = bool
}

variable "enable_dns_support" {
  description = "Put true if you want to enable"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Put true if you want to enable"
  type        = bool
}