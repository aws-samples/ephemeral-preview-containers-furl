# ephemeral-preview-containers-furl

This repo contains sample code for the [Previewing environments using containerized AWS Lambda functions](https://aws.amazon.com/blogs/compute/previewing-environments-using-containerized-aws-lambda-functions/) blog post.

In the post we describe some of the benefits of using ephemeral environments in CI/CD pipelines in general and show how to implement a pipeline using GitHub Actions and AWS Lambda Function URLs for extremely fast, low-cost, ephemeral environments.  In this example, every PR can be deployed in seconds, and we pay only for actual HTTP requests made to the environment.  There are no compute costs incurred while a PR is open and no one is previewing the environment.  We only pay for Lambda invocations while stakeholders are actively interacting with the environment.  When a PR is eventually merged or closed, the cloud infrastructure is completely disposed of.


## Usage

1. Create a [new repository based on this template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).

2. To configure the pipeline, we'll need two AWS resources in order to run Terraform inside of GitHub actions.  An [**IAM Role**](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) that can be assumed by GitHub, and a place to store [**Terraform state**](https://developer.hashicorp.com/terraform/language/state). You can use the Terraform configuration located under [.github/setup](./.github/setup) to create these resources. You'll want to store the local `.tfstate` file someplace safe so that you can manage these resources in the future if you wish.  Note that you'll need to provide the name of your GitHub organization and repository in the [terraform.tfvars](./.github/setup/terraform.tfvars) file as input variables.

```sh
cd .github/setup
cat terraform.tfvars
github_org  = "<your github org or user>"
github_repo = "ephemeral-preview-containers-furl"

terraform init && terraform apply
...
Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

AWS_REGION = "us-east-1"
AWS_ROLE = "arn:aws:iam::123456789012:role/github-action-ephemeral-preview-containers-furl"
TF_BACKEND_S3_BUCKET = "tf-state-123456789012"
```

3. We'll take the generated IAM Role and bucket name and place it into our configuration file located under [.github/workflows/config.env](./.github/workflows/config.env).  This config file is read and used by our GitHub Action Workflow.

```sh
export AWS_REGION="us-east-1"

export AWS_ROLE="arn:aws:iam::123456789012:role/github-action-ephemeral-preview-containers-furl"

export TF_BACKEND_S3_BUCKET="tf-state-123456789012"
```

Note that this IAM Role has an inline policy that contains the minimum set of permission needed to provision the AWS resources.  This assumes that your application does not interact with external services like databases or caches.  If your application needs this access, you can add the required permissions to the policy located [here](./.github/setup/policy.tmpl).

*Setup complete!*

At this point, you can submit a PR and it will be deployed to an ephemeral preview environment using a containerized Lambda Function URL!
