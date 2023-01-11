locals {
  owner       = var.owner
  environment = var.environment
  division    = var.division
  common_tags = {
    name = "${local.owner}-${local.environment}-${local.division}"
    Type = "terraform_tags"
  }
}