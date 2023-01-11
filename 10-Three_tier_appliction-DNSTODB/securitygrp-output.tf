#private_security_group
output "private_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.private_security_group.security_group_arn
}

output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}

#public_security_group
output "public_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.public_security_group.security_group_arn
}

output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}

#alb_security_group
output "alb_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.alb_security_group.security_group_arn
}

output "alb_group_id" {
  description = "The ID of the security group"
  value       = module.alb_security_group.security_group_id
}
