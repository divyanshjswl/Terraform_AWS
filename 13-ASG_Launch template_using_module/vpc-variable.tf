variable "cidr" {
  description = "Please provide the VPC CIDR range here"
  type        = string
}
variable "azs" {
  description = "Please provide the list of Azs"
  type        = list(string)
}
variable "private_subnets" {
  description = "Please describe the list of private subnets"
  type        = list(string)
}
variable "public_subnets" {
  description = "Please provide the list of public subnets here"
  type        = list(string)
}
variable "enable_nat_gateway" {
  description = "Please put true here if it is required"
  type        = bool
}
variable "single_nat_gateway" {
  description = "Please put true here if it is required"
  type        = bool
}
variable "enable_dns_hostnames" {
  description = "Please put true here if it is required"
  type        = bool
}
variable "enable_dns_support" {
  description = "value"
  type        = bool
}
variable "create_database_subnet_route_table" {
  description = "Please put true here if it is required"
  type        = bool
}
variable "create_database_subnet_group" {
  description = "Please put true here if it is required"
  type        = bool
}
variable "database_subnets" {
  description = "Please provide the List of database subnet CIDR range"
  type        = list(string)
}