resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.divyansh29033dottk.zone_id
  name    = "website.divyansh29033.tk"
  type    = "A"
  ttl     = 300
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}