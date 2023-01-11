variable "everywhere_CIDR" {
  description = "Put everywhere CIDR here"
  type        = string
}

variable "public_sg_ingress_cidr_block" {
  description = "Please provide ingress cidr block for public SG"
  type = list(string)
}