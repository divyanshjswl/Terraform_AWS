module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.1.0"

  domain_name  = trimsuffix(data.aws_route53_zone.divyansh_route53.name, ".")
  zone_id      = data.aws_route53_zone.divyansh_route53.zone_id

  subject_alternative_names = [
    "*.divyansh29033.tk"
  ]

  wait_for_validation = var.wait_for_validation

  tags = {
    Name = "${local.owner}-${local.division}-${local.environment}-ACM"
    Owner = "${local.owner}"
    Division = "${local.division}"
    Environment = "${local.environment}"
  }
}