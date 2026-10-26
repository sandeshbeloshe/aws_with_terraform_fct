module "s3_module" {
  source      = "../../../../modules/storage/S3"
  bucket_name = var.bucket_name
  environment = var.environment
  aws_region  = var.aws_region
}