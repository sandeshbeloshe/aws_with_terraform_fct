terraform init
terraform workspace new qa
terraform plan --var-file=qa.tfvars
terraform apply --var-file=qa.tfvars --auto-approve