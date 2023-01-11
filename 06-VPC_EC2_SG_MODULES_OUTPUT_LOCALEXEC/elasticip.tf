resource "aws_eip" "public_instance" {
  depends_on = [module.public_ec2_instance, module.vpc]
  instance   = module.public_ec2_instance.id
  vpc        = true
}

output "Eip_id" {
  description = "This will provide output of Elastic IP"
  value       = aws_eip.public_instance.public_ip
}