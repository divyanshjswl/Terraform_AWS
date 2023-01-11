#Public SG 
variable "publicsg_ingress_cidr_blocks" {
    description = "Please provide Public SG inbound CIDR range here"
    type = list(string)
}

#Private SG


#ALB SG
variable "alb_sg_ingress_cidr_blocks" {
    description = "Please provide ALB SG inbound CIDR range here"
    type = list(string)
}
