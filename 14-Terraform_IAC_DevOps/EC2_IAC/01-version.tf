# Terraform Block
terraform {
  required_version = ">= 1.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }          
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {}      
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}