variable "ami" {
    description = "This is the AMI of the EC2 Instance"
    type = string
}

variable "instance_type" {
    description = "This is the Instance type"
    type = string
}

variable "instance_key" {
    description = "Key-pair used to login EC2 instance"
    type = string
}

variable "subnet_id" {
    description = "Key-pair used to login EC2 instance"
    type = string
}



variable "security_group" {
    description = "Key-pair used to login EC2 instance"
    type = string
}