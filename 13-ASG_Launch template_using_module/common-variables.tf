variable "aws_region" {
  description = "Please define the AWS region here"
  type        = string
}
variable "owner" {
  description = "Please describe who is the owner of the project"
  type        = string
}
variable "division" {
  description = "Please select the division here"
  type        = string
}
variable "environment" {
  description = "Please select the environment here"
  type        = string
}
variable "cost_center" {
  description = "Please define the cost center here"
  type        = number
}