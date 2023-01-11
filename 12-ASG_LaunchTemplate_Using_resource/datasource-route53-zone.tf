data "aws_route53_zone" "my_route53_zone" {
  name         = "divyansh29033.tk"
}



output "my_route53_zone_id" {
    description = "Output of zone id"
    value = data.aws_route53_zone.my_route53_zone.zone_id
}
output "my_route53_zone_arn" {
    description = "Output of Zone arn"
    value = data.aws_route53_zone.my_route53_zone.arn
}
output "my_route53_zone_name" {
    description = "Output of Zone arn"
    value = data.aws_route53_zone.my_route53_zone.name
}
