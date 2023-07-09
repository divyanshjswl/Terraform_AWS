output "ec2_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}

## ec2_bastion_public_ip
output "ec2_instance_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.ec2_instance.public_ip 
}
