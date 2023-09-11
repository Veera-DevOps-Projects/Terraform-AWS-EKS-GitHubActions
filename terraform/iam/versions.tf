terraform {
  #   required_version = ">= 4.48.0"
  backend "s3" {
    bucket = "aws-eks-terraform-demo"
    key    = "dev/Terraform-AWS-EKS-GitHubActions/iam-roles.tfstate"
    region = "eu-central-1"

    #dynamodb_table = "vpc-solution"
  }
}

provider "aws" {
  region = var.aws_region
}