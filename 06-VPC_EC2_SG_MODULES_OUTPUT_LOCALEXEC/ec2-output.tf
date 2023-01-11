#Public instance output
output "public_instance_id" {
  description = "The ID of the instance"
  value       = module.public_ec2_instance.id
}
/*
AS I AM USING ELASTIC IP, THIS WILL CHANGE. HENCE OUTPUT OF EIP DEFINED IN ELASTICIP.TF 
output "public_instance_pip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.public_ec2_instance.public_ip
}
*/
#Private instance output
output "private_ec2_instance" {
  description = "The ID of the instance"
  value       = module.private_ec2_instance[*].id //If you are using "ELEMENT FUNCTION" and have multiple outputs always use [*] after the resource.
}
output "private_instance_privip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.private_ec2_instance[*].private_ip //like here and above we have 2 private IPS and private instances
}

