data "aws_route53_zone" "divyansh_route53" {
  name         = "divyansh29033.tk"
}

output "route53_hosted_zone_id" {
    description = "This will provide route53- zone id"
    value = data.aws_route53_zone.divyansh_route53.zone_id
}

output "route53_hosted_dns_name" {
    description = "This will provide route53- zone DNS name"
    value = data.aws_route53_zone.divyansh_route53.name
}