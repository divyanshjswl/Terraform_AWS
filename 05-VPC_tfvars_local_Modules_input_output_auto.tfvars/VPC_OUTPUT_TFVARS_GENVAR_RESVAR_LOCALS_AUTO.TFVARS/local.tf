locals {
  name        = "${local.owner}-${local.division}-${local.environment}"
  owner       = var.owners
  environment = var.environment
  division    = var.division
  common_tags = {
    owner       = local.owner
    environment = local.environment
    division    = local.division
  }
}