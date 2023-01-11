#public_ec2_instance
output "public_ec2_id" {
  description = "The ID of the instance"
  value       = module.public_ec2_instance.id
}
output "bastion_ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.public_ec2_instance.public_ip
}
#private_ec2_instance
output "private_ec2_id" {
  description = "The ID of the instance"
  value       = module.private_ec2_instance[*].id
}
output "private_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.private_ec2_instance[*].private_ip
}