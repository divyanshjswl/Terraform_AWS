data "aws_route53_zone" "my_r53_public_zone" {
  name = "divyansh29033.tk"
}

#output
output "my_r53_public_zone_id" {
  description = "List of route53 zone id"
  value       = data.aws_route53_zone.my_r53_public_zone.zone_id
}
output "my_r53_public_zone_name" {
  description = "List of route53 zone name"
  value       = data.aws_route53_zone.my_r53_public_zone.name
}