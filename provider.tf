provider "aws" {
  region     = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket = "BUCKET-NAME"
    key    = "NAME YOU WANT"
    region = "us-east-1"
  }
}