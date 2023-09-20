DEV
terraform init -reconfigure -backend-config=DEV/backend.tf
terraform plan -var-file=DEV/dev.tfvars
terraform apply -auto-approve -var-file=DEV/dev.tfvars

PROD
terraform init -reconfigure -backend-config=PROD/backend.tf
terraform plan -var-file=PROD/prod.tfvars
terraform apply -auto-approve -var-file=PROD/prod.tfvars

terraform.tfvars --> ll get the higest presedence 