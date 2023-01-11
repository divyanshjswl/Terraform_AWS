variable "aws_region" {
    description = "Please put AWS region here, where you want to deploy your resources"
    type = string
}
variable "owner" {
    description = "Please define the owner of the project here"
    type = string
}
variable "division" {
    description = "Please select the division and put the name here"
    type = string
}
variable "environment" {
    description = "Please select the environment and put the name here"
    type = string
}
variable "cost_center" {
    description = "Please provide the value of Cost center here"
    type = number
}