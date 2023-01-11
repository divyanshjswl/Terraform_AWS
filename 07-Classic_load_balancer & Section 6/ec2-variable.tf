variable "instance_type" {
  description = "Please define the instance type here"
  type        = map(string)
}

variable "key_name" {
  description = "Please provide the keypair name used to login to AWS EC2 instance"
  type        = string
}

variable "private_instance_count" {
  description = "Please define how many instances launched in private subnet"
  type        = number
}