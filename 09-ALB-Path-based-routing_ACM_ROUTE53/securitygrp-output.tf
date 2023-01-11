#Public SG
output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}

#Private SG
output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}

#ALB SG
output "alb_security_group_id" {
  description = "The ID of the security group"
  value       = module.ALB_security_group.security_group_id
}
