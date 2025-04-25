provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# backend s3
terraform {
  backend "s3" {
    bucket  = ""
    key     = ""
    region  = ""
    profile = ""
  }
}
