output "ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_instance.id
}

output "ec2_instance_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_instance.arn
}
output "ec2_instance_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_instance.public_dns
}
output "ec2_instance_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_instance.public_ip
}