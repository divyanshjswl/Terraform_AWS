variable "instance_type" {
  description = "Please describe EC2 instance type here based on the Environment"
  type        = map(string)
}

variable "keypair_name" {
  description = "Please define krypair name used to login to the EC2 machine"
  type        = string
}

variable "private_instance_count" {
  description = "Please define Private instance count here"
  type        = number
}