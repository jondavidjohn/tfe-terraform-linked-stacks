## Simplified linked stacks demo

This is intended to run against local development (tfcdev)

1. Copy `terraform.example.tfvars` to `terraform.tfvars` and update the values as needed.
2. Make sure you have the `TFE_TOKEN` environment variable set with your TFC API token.
3. Make sure you have the terraform version specified in `.terraform-version` installed.
3. Run `terraform init` to initialize the Terraform configuration.
4. Run `terraform apply` to create the linked stacks in your local (tfcdev) TFC.
