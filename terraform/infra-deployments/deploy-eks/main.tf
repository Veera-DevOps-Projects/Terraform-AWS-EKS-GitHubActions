module "parameters" {
  source     = "../../modules/parameter-store"
  parameters = var.parameters
}

module "k8s" {
  source = "../../modules/k8s"

  business_division                    = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/business_division"]
  environment                          = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/environment"]
  aws_region                           = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/aws_region"]
  cluster_name                         = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_name"]
  cluster_service_ipv4_cidr            = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_service_ipv4_cidr"]
  cluster_version                      = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_version"]
  cluster_endpoint_private_access      = tobool(module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_private_access"])
  cluster_endpoint_public_access       = tobool(module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_public_access"])
  cluster_endpoint_public_access_cidrs = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/cluster_endpoint_public_access_cidrs"])
  eks_control_role                     = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/eks_control_role"]
  vpc_name                             = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_name"]

  nodegroup_role      = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/nodegroup_role"]
  vpc_public_subnets  = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_public_subnets"])
  vpc_private_subnets = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_private_subnets"])
  eks_nodegroup_list  = var.eks_nodegroup_list

  depends_on = [module.parameters]
}