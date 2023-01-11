#public_ec2_instance
output "public_ec2_id" {
  description = "The ID of the instance"
  value       = module.public_ec2_instance.id
}
output "ec2_complete_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_complete_public_ip.public_ip
}

#app1_private_ec2_instance
output "app1_private_ec2_id" {
  description = "The ID of the instance"
  value       = module.app1_private_ec2_instance[*].id
}
output "app1_ec2_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.app1_private_ec2_instance[*].private_ip
}
#app2_private_ec2_instance
output "app2_private_ec2_id" {
  description = "The ID of the instance"
  value       = module.app2_private_ec2_instance[*].id
}
output "app2_ec2_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.app2_private_ec2_instance[*].private_ip
}