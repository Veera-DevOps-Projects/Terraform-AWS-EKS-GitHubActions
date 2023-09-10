aws_region = "eu-central-1"

eks_nodegroup_list = [
  {
    name           = "finance-dev-eksdemo1-eks-ng-public"
    is_private     = false
    ami_type       = "AL2_x86_64"
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
    instance_types = ["t3.micro"]#["t3.medium"]
    remote_access = {
      ec2_ssh_key = "demokey1"
    }
    scaling = {
      expected = 1
      min      = 1
      max      = 2
    }
    update_config = {
      max_unavailable = 1
    }
  },
  {
    name           = "finance-dev-eksdemo1-eks-ng-private"
    is_private     = true
    ami_type       = "AL2_x86_64"
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
    instance_types = ["t3.micro"] #["t3.medium"]
    remote_access = {
      ec2_ssh_key = "demokey1"
    }
    scaling = {
      expected = 1
      min      = 1
      max      = 2
    }
    update_config = {
      max_unavailable = 1
    }
  }
]

parameters = ["/Terraform-AWS-EKS-GitHubActions/aws_region", "/Terraform-AWS-EKS-GitHubActions/business_division", "/Terraform-AWS-EKS-GitHubActions/environment",
  "/Terraform-AWS-EKS-GitHubActions/cluster_name", "/Terraform-AWS-EKS-GitHubActions/cluster_service_ipv4_cidr", "/Terraform-AWS-EKS-GitHubActions/cluster_version",
  "/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_private_access", "/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_public_access", "/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_public_access_cidrs",
  "/Terraform-AWS-EKS-GitHubActions/eks_control_role", "/Terraform-AWS-EKS-GitHubActions/nodegroup_role", "/Terraform-AWS-EKS-GitHubActions/vpc_name", "/Terraform-AWS-EKS-GitHubActions/vpc_public_subnets",
"/Terraform-AWS-EKS-GitHubActions/vpc_private_subnets"]