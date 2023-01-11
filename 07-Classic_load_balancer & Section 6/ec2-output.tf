#Public EC2 Instance Output
output "public_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.public_ec2_instance.id
}
output "public_ec2_instance_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.public_ec2_instance.public_ip
}



#Private EC2 Instance Output
output "private_ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.private_ec2_instance[*].id
}