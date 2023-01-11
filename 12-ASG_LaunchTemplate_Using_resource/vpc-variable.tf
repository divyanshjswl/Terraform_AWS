variable "cidr" {
    description = "Please provide the VPC CIDR range here"
    type = string
}
variable "azs" {
    description = "Please provide the List of Azs here"
    type = list(string)
}
variable "private_subnets" {
    description = "Please provide the List of private subnet CIDr ranges here"
    type = list(string)
}
variable "public_subnets" {
    description = "Please provide the List of public subnet CIDr range here"
    type = list(string)
}
variable "enable_nat_gateway" {
    description = "Please select true her if required"
    type = bool
}
variable "single_nat_gateway" {
    description = "Please select true her if required"
    type = bool
}
variable "enable_dns_hostnames" {
    description = "Please select true her if required"
    type = bool
}
variable "enable_dns_support" {
    description = "Please select true her if required"
    type = bool
}
variable "database_subnets" {
    description = "Please provide the list of database subnet CIDR range here"
    type = list(string)
}
variable "create_database_subnet_group" {
    description = "Please select true her if required"
    type = bool
}
variable "create_database_subnet_route_table" {
    description = "Please select true her if required"
    type = bool
}