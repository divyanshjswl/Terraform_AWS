variable "min_size" {
  description = "Please select the minimus size of the ASG"
  type        = number
}
variable "max_size" {
  description = "Please select the maximum size of the ASG"
  type        = number
}
variable "desired_capacity" {
  description = "Please select the desired capacity of the ASG"
  type        = number
}