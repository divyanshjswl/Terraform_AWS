#bastion_ec2_instance
output "bastion_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.bastion_ec2_instance.id
}
output "bastion_ec2_instance_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.bastion_ec2_instance.public_ip
}

#private_app1_ec2_instance
output "private_app1_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.private_app1_ec2_instance.id
}
output "private_app1_ec2_instance_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.private_app1_ec2_instance.private_ip
}


#private_app2_ec2_instance
output "private_app2_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.private_app2_ec2_instance.id
}
output "private_app2_ec2_instance_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.private_app2_ec2_instance.private_ip
}

#private_app3_ec2_instance
output "private_app3_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.private_app3_ec2_instance.id
}
output "private_app3_ec2_instance_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.private_app3_ec2_instance.private_ip
}
