terraform init
terraform workspace new prod
terraform plan --var-file=prod.tfvars
terraform apply --var-file=prod.tfvars --auto-approve