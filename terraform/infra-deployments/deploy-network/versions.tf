terraform {

  backend "s3" {
    bucket = "aws-terraform-demo"
    key    = "dev/Terraform-AWS-EKS-GitHubActions/network.tfstate"
    region = "us-east-1"

    dynamodb_table = "vpc-solution"
  }
}

provider "aws" {
  region = var.aws_region
}