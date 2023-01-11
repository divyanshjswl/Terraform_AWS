variable "instance_type" {
    description = "Please provide the map of string of instnace type based on Environment"
    type = map(string)
}
variable "key_name" {
    description = "Please provide the Ec2 keypair name used to login to the server"
    type = string
}