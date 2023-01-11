#public_security_group
output "public_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.public_security_group.security_group_arn
}
output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}
output "public_security_group_name" {
  description = "The name of the security group"
  value       = module.public_security_group.security_group_name
}

#private_security_group
output "private_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.private_security_group.security_group_arn
}
output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}
output "private_security_group_name" {
  description = "The name of the security group"
  value       = module.private_security_group.security_group_name
}

#alb_security_group
output "alb_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.alb_security_group.security_group_arn
}
output "alb_security_group_id" {
  description = "The ID of the security group"
  value       = module.alb_security_group.security_group_id
}
output "alb_security_group_name" {
  description = "The name of the security group"
  value       = module.alb_security_group.security_group_name
}