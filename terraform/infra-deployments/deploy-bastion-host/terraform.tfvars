aws_region    = "eu-central-1"
instance_type = "t3.micro"
instance_user = "ec2-user"
key_pair_name = "demokey1"

parameters = ["/Terraform-AWS-EKS-GitHubActions/environment", "/Terraform-AWS-EKS-GitHubActions/business_division",
"/Terraform-AWS-EKS-GitHubActions/vpc_public_subnets", "/Terraform-AWS-EKS-GitHubActions/vpc_name"]