variable "vpc_azs" {
  description = "This is to define AWS Az where the subnets can be created "
  type        = list(string)
}

variable "vpc_cidr" {
  description = "This is to define CIDR range of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "This is to define Private Subnet CIDR range "
  type        = list(string)
}

variable "public_subnets" {
  description = "This is to define the Public Subnet CIDR range"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "If NAT gateway required put the value as true, this input is true/false, so the type will be boolean"
  type        = bool
}

variable "single_nat_gateway" {
  description = "If HA required forNAT gateway put the value as true, this input is true/false, so the type will be boolean"
  type        = bool
}

variable "database_subnets" {
  description = "This is to define CIDR range of database subnet"
  type        = list(string)
}

variable "create_database_subnet_group" {
  description = "If required put true,this input is true/false, so the type will be boolean "
  type        = bool
}

variable "create_database_subnet_route_table" {
  description = "If required put true,this input is true/false, so the type will be boolean"
  type        = bool
}

variable "enable_dns_support" {
  description = "If required put true,this input is true/false, so the type will be boolean"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "If required put true,this input is true/false, so the type will be boolean"
  type        = bool
}