terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-sandesh-fct" #this must be your s3 bucket name
    key    = "compute/fctp/dev/ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
