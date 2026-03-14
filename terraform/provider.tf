terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.28.0"
    }
  }
  
  backend "s3" {
    bucket = "vpc-aws-test"
    key    = "expense-infra-dev-backend"
    region = "us-east-1"
    dynamodb_table = "vpc-test"
  }
}


provider "aws" {
  region = "us-east-1"
}