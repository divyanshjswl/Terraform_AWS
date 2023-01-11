variable "instance_type" {
  description = "Please select the instance type based on the environment"
  type        = map(string)
}
variable "key_name" {
  description = "Please provide the key pair name "
  type        = string
}