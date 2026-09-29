terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-san-fct" #this must be your s3 bucket name
    key    = "compute/fctp/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}
