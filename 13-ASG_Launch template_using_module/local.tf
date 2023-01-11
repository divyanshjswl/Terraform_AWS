locals {
  owner       = var.owner
  division    = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}