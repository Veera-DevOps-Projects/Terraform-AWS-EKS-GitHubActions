terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.65"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
  }

  backend "s3" {
    bucket = "aws-eks-terraform-demo"

    key = "dev/Terraform-AWS-EKS-GitHubActions/mediawiki.tfstate"

    region = "eu-central-1"

    dynamodb_table = "vpc-solution"
  }
}