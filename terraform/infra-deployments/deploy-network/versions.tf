terraform {

  backend "s3" {
    bucket = "aws-eks-terraform-demo"
    key    = "dev/Terraform-AWS-EKS-GitHubActions/network.tfstate"
    region = "eu-central-1"

    dynamodb_table = "vpc-solution"
  }
}

provider "aws" {
  region = var.aws_region
}