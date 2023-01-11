variable "aws_region" {
  description = "Please provide AWS region where you want to deploy your resources"
  type        = string
}
variable "owner" {
  description = "Please define who is the owner of the project"
  type        = string
}
variable "division" {
  description = "Please select division here"
  type        = string
}
variable "environment" {
  description = "Please select the environment here"
  type        = string
}
variable "cost_center" {
  description = "Please provide the value of cost center here"
  type        = number
}