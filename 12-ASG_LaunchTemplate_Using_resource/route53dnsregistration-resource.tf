resource "aws_route53_record" "route53_record_dns" {
  zone_id = data.aws_route53_zone.my_route53_zone.zone_id
  name    = "divyansh29033.tk"
  type    = "A"
  ttl     = 300
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}