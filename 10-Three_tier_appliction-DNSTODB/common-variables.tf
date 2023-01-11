variable "aws_region" {
    description = "Please provide AWS region here"
    type = string
}

variable "owner" {
    description = "Please describe owner of the project"
    type = string
}

variable "environment" {
    description = "Please select the division and put here"
    type = string
}

variable "division" {
    description = "Please select the division and put here"
    type = string
}

variable "cost_center" {
    description = "Please provide the cost center of the project"
    type = number
}