data "aws_route53_zone" "route53_zone" {
  name = "divyansh29033.tk"
}


#Outputs
output "aws_route53_zone_domain_name" {
  description = "This will provide you the output of dns zone domain name"
  value       = data.aws_route53_zone.route53_zone.name
}
output "aws_route53_zone_domain_zone_id" {
  description = "This will provide you the output of dns zone zone id"
  value       = data.aws_route53_zone.route53_zone.zone_id
}