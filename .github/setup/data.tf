data "aws_caller_identity" "current" {}

data "tls_certificate" "github_actions_oidc_provider" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

data "aws_region" "current" {}
