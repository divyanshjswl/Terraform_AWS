variable "instance_type" {
  description = "Please provide the AWS instancetype here based on environment"
  type        = map(string)
}
variable "key_name" {
  description = "Please provide the instance key pair name here"
  type        = string
}