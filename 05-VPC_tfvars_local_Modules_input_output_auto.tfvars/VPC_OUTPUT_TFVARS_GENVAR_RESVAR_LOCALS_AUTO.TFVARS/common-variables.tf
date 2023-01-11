variable "aws_region" {
  description = "This is to define the AWS region"
  type        = string
}

variable "owners" {
  description = "Please difine the owner here"
  type        = string
}

variable "environment" {
  description = "Please define Environment here Dev/Stg/Prd"
  type        = string
}

variable "division" {
  description = "Please define the Division here EMS/JGP/ENT/GDP"
  type        = string
}