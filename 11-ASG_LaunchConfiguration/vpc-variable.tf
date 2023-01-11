variable "azs" {
  description = "Please select vpc az here"
  type        = list(string)
}
variable "private_subnets" {
  description = "Please provide the vpc private subnet here"
  type        = list(string)
}
variable "cidr" {
  description = "Please provide the vpc CIDR range here"
  type        = string
}
variable "public_subnets" {
  description = "Please provide the public subnet CIDR range here"
  type        = list(string)
}
variable "enable_nat_gateway" {
  description = "Please provide true here if reauired"
  type        = bool
}
variable "single_nat_gateway" {
  description = "Please provide true here if reauired"
  type        = bool
}
variable "enable_dns_hostnames" {
  description = "Please provide true here if reauired"
  type        = bool
}
variable "enable_dns_support" {
  description = "Please provide true here if reauired"
  type        = bool
}
variable "database_subnets" {
  description = "Please provide database subnet CIDR range here"
  type        = list(string)
}
variable "create_database_subnet_group" {
  description = "Please provide true here if reauired"
  type        = bool
}
variable "create_database_subnet_route_table" {
  description = "Please provide true here if reauired"
  type        = bool
}