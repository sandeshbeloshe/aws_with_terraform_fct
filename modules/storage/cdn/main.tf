resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "${var.environment}-${var.bucket_name}-oac"
  description                       = "CloudFront access to the frontend bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  default_root_object = "index.html"
  price_class         = var.price_class
  aliases             = var.aliases

  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = var.bucket_name
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  default_cache_behavior {
    target_origin_id       = var.bucket_name
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = merge(
    {
      Name        = "${var.environment}-${var.bucket_name}-cdn"
      Environment = var.environment
    },
    var.tags
  )
}
