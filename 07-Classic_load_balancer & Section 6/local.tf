locals {
  owner       = var.owner
  environment = var.environment
  division    = var.division
  cost_center = var.cost_center
  common_tags = {
    name        = "${local.owner}-${local.division}-${local.environment}"
    cost_center = var.cost_center
  }
}