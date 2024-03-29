terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.31.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "aws" {
    region = var.aws_region
}



# Random resource
resource "random_pet" "test" {
  byte_length = 2
}