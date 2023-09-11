data "terraform_remote_state" "eks_state" {
  backend = "s3"
  config = {
    bucket = "aws-eks-terraform-demo"
    key    = "dev/Terraform-AWS-EKS-GitHubActions/eks.tfstate"
    region = "eu-central-1"
  }
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks_state.outputs.cluster_id
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.terraform_remote_state.eks_state.outputs.cluster_id
}