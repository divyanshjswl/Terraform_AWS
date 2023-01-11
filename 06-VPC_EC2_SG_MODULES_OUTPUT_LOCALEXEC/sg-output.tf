# Private SG Output
output "my_private_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.private_security_group.security_group_arn
}

output "my_private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}

output "my_private_security_group_name" {
  description = "The name of the security group"
  value       = module.private_security_group.security_group_name
}


# Public SG Output
output "my_public_security_group_arn" {
  description = "The ARN of the security group"
  value       = module.public_security_group.security_group_arn
}

output "my_public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}

output "my_public_security_group_name" {
  description = "The name of the security group"
  value       = module.public_security_group.security_group_name
}