resource "aws_s3_bucket" "main" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_public_access_block" "main_public_access_block" {
  bucket = aws_s3_bucket.main.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

