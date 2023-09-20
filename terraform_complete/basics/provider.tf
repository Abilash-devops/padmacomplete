terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
  backend "s3" {
    bucket   = "roboshop-terraform-padmasrikanth"
    key = "complete"
    region = "us-east-1"
    dynamodb_table = "dev-padma-roboshop"
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}