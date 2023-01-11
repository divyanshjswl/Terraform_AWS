variable "instance_type" {
    description = "Please provide the EC2 instance type here"
    type = map(string)
}

variable "keypair_name" {
    description = "Please provide EC2 keypair name which will be used to login to instance"
    type = string
}

variable "private_instance_count" {
    description = "Please provide number of Private instances you want to launch"
    type = number
}