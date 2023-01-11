variable "load_balancer_type" {
  description = "Please select Load balancer type here"
  type        = string
}

variable "http_listner_target_group_index" {
  description = "Please provide HTTP listner trgaet group index, i.e on which TG you want to route the request."
  type        = number
}

// Target group variables below

variable "target_type" {
  description = "Please provide the target type here"
  type        = string
}