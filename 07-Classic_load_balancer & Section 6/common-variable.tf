variable "aws_region" {
  description = "This is the default region which will be used to provision resources"
  type        = string
}

variable "owner" {
  description = "Please define owner of the project here"
  type        = string
}

variable "environment" {
  description = "Please define the environment Dev/Stg/Prd"
  type        = string
}

variable "division" {
  description = "Please define the division here EMS/JGP/GDP"
  type        = string
}

variable "cost_center" {
  description = "Please define the Cost centre here"
  type        = string
}