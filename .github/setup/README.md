# setup

Provisions an IAM role that can be assumed by the GitHub Action in this repo and an S3 bucket used for storing Terraform remote state.

```sh
terraform init && terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_state_s3_bucket"></a> [terraform\_state\_s3\_bucket](#module\_terraform\_state\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.github_actions_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [tls_certificate.github_actions_oidc_provider](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | the name of the github organization | `string` | n/a | yes |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | the name of the github repo | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | aws region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_AWS_REGION"></a> [AWS\_REGION](#output\_AWS\_REGION) | n/a |
| <a name="output_AWS_ROLE"></a> [AWS\_ROLE](#output\_AWS\_ROLE) | n/a |
| <a name="output_TF_BACKEND_S3_BUCKET"></a> [TF\_BACKEND\_S3\_BUCKET](#output\_TF\_BACKEND\_S3\_BUCKET) | n/a |
