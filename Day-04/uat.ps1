terraform init
terraform workspace new uat
terraform plan --var-file=uat.tfvars
terraform apply --var-file=uat.tfvars --auto-approve