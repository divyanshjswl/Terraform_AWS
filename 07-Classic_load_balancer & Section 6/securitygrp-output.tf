#Public SG output
output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = module.public_security_group.security_group_id
}


#Private SG output
output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = module.private_security_group.security_group_id
}


#LB SG output
output "lb_security_group_id" {
  description = "The ID of the LB security group"
  value       = module.lb_security_group.security_group_id
}