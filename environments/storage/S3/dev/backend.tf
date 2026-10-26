terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-sandesh-fct" #this must be your s3 bucket name
    key    = "security/fctp/dev/s3/demo/terraform.tfstate"
    region = "ap-south-1"
  }
}
