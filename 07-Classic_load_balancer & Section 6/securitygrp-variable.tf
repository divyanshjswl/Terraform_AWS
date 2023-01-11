variable "ingress_cidr_blocks" {
  description = "Please provide everywhere CIDR range here"
  type        = list(string)
}

variable "lbsg_inbound_cidrblock" {
  description = "Please provide everywhere cidr range to allow"
  type        = string
}