provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "tf-state-999"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-999"
    encrypt        = true
  }
}
