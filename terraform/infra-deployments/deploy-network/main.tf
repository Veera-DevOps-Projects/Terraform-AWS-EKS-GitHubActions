module "parameters" {

  source     = "../../modules/parameter-store"
  parameters = var.parameters

}

module "network" {

  source                 = "../../modules/network"
  business_division      = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/business_division"]
  environment            = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/environment"]
  vpc_availability_zones = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_availability_zones"])
  vpc_cidr_block         = module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_cidr_block"]
  vpc_public_subnets     = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_public_subnets"])
  vpc_private_subnets    = split(",", module.parameters.values["/Terraform-AWS-EKS-GitHubActions/vpc_private_subnets"])


  depends_on = [module.parameters]
}