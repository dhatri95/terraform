terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "expense-dhatri"
    key    = "provisioners-demo"
    region = "us-east-1"
    dynamodb_table = "lockingtable"
  }
}

provider "aws" {
  region = "us-east-1"
}