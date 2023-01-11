#private_security_group
output "Private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}
output "private_security_group_name" {
  description = "The name of the security group"
  value       = module.private_security_group.security_group_name
}

#public_security_group
output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}
output "public_security_group_name" {
  description = "The name of the security group"
  value       = module.public_security_group.security_group_name
}

#ALB_security_group
output "alb_security_group_id" {
  description = "The ID of the security group"
  value       = module.ALB_security_group.security_group_id
}
output "alb_security_group_name" {
  description = "The name of the security group"
  value       = module.ALB_security_group.security_group_name
}
