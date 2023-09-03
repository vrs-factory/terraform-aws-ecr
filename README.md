# Terraform Module - AWS ECR

Terraform module to provision an Elastic Container Repository (ECR) for AWS.

## Usage

```terraform
module "project_api" {
  source = "git::https://github.com/vrs-factory/terraform-aws-ecr-repository?ref=v1.0.0"

  namespace        = "vrs-factory/project"
  name             = "api"
  max_images_count = 30
}
```
