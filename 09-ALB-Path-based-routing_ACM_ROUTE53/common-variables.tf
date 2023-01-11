variable "aws_region" {
    description = "Please provide AWS region here, where you want to deploy all the resources using terraform"
    type = string
}

variable "owner" {
    description = "Please provide the project owner name here"
    type = string
}

variable "division" {
    description = "Please provide teh division name here EMS/JGP/GDP"
    type = string
}

variable "environment" {
    description = "Please provide the environment name here Dev/Stg/Prd"
    type = string
}

variable "cost_center" {
    description = "Please provide the cost center value here"
    type = number
}