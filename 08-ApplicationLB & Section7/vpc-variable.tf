variable "vpc_cidr" {
  description = "Please define VPC CIDR range here"
  type        = string
}
variable "vpc_azs" {
  description = "Please define VPC AZs here"
  type        = list(string)
}

variable "private_subnets" {
  description = "Please define Private subnet CIDR range here"
  type        = list(string)
}

variable "public_subnets" {
  description = "Please define the public subnet CIDR range here"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Please put true if required"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Please put true if it is required"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Please put true if required"
  type        = bool
}

variable "enable_dns_support" {
  description = "Please put true if it is required"
  type        = bool
}

variable "database_subnets" {
  description = "Please define the database subnets CIDR reange here"
  type        = list(string)
}

variable "create_database_subnet_group" {
  description = "Please out true here if it is required"
  type        = bool
}

variable "create_database_subnet_route_table" {
  description = "Please out true here if it is required"
  type        = bool
}