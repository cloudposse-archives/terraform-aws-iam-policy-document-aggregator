terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.23"
    }
    utils = {
      source = "cloudposse/utils"
      version = ">= 0.3.0"
    }
  }
}
