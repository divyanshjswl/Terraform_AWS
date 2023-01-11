variable "instance_type" {
    description = "Please provide EC2 instance type you want for the server"
    type = map(string)
}
variable "key_name" {
    description = "Pleas provide Ec2 key pair name"
    type = string
}
variable "instance_count" {
    description = "Please put how much instance to provision"
    type = number
}