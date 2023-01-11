module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.1.0"

  domain_name = trimsuffix(data.aws_route53_zone.route53_zone.name, ".")
  zone_id     = data.aws_route53_zone.route53_zone.zone_id

  subject_alternative_names = ["*.divyansh29033.tk"]

  wait_for_validation = var.wait_for_validation

  tags = {
    Name = "divyansh29033.tk"
  }
}