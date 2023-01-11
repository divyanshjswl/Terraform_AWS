data "aws_route53_zone" "divyansh29033dottk" {
  name         = "divyansh29033.tk"
  private_zone = false
}

output "domain_zoneid" {
    description = "This will provide the output of Route53 hosted zone id divyansh29033.tk"
    value = data.aws_route53_zone.divyansh29033dottk.zone_id
}
output "domain_zone_name" {
    description = "This will provide the output of Route53 hosted zone name divyansh29033.tk"
    value = data.aws_route53_zone.divyansh29033dottk.name
}