resource "aws_route53_record" "my_route53_dns" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = ""
  type    = "A"
  ttl     = "300"
  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }
}