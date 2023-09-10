data "aws_ssm_parameters_by_path" "eks_with_tf_store" {
  path = "/Terraform-AWS-EKS-GitHubActions"
}

data "aws_ssm_parameter" "tf_parameter" {
  for_each = var.parameters

  name = each.value
}