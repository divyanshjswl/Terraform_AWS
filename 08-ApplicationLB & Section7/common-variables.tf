variable "aws_region" {
  description = "This region will be used to deploy all the resources in AWS"
  type        = string
}

variable "owner" {
  description = "Please provide name of the owner of the project"
  type        = string
}

variable "division" {
  description = "Please provide division name here EMS/JGP/GDP"
  type        = string
}

variable "environment" {
  description = "Please select the Environment here DEV/STG/PRD"
  type        = string
}

variable "cost_center" {
  description = "Please provide the cost center here"
  type        = number
}