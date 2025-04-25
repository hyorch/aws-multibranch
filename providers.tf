provider "aws" {
  profile = "HyorchAdmin" # AWS SSO Profile
  region  = "eu-south-2"
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
