data "aws_caller_identity" "check_deploy_account" {
  
}

data "aws_region" "check_deploy_region" {
  
}

variable "deploy_account_id" {
  description = "The AWS account ID where the resources will be deployed."
  type        = string
  default = "123456789999"
}

locals {
  is_allowed_account = data.aws_caller_identity.check_deploy_account.account_id == var.deploy_account_id
}

resource "null_resource" "check_deploy_account" {
  lifecycle {
    precondition {
      condition = local.is_allowed_account
      error_message = "このTerraformコードは指定されたアカウント(${var.deploy_account_id})でのみ実行可能です。現在のアカウントは: ${data.aws_caller_identity.check_deploy_account.account_id}です。"
    }
  }
}