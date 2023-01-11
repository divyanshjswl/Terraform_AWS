variable "instance_type" {
  description = "This is to define the EC2 instance type based on Environment"
  type        = map(string)
}

variable "instance_keyname" {
  description = "This is to define the EC2 instance keypair name"
  type        = string
}

variable "private_instance_count" {
  description = "Please provide input how many instances required to provision in private subnet"
  type        = number
}