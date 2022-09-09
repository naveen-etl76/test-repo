terraform {
  backend "s3" {
    bucket         = "dl-test-tfstate"
    key            = "dl-test-tf.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dl-test-tfstate-lock"
  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.54.0"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
}

