output "AWS_ROLE" {
  value = aws_iam_role.github_actions.arn
}

output "TF_BACKEND_S3_BUCKET" {
  value = module.terraform_state_s3_bucket.s3_bucket_id
}

output "AWS_REGION" {
  value = data.aws_region.current.name
}
