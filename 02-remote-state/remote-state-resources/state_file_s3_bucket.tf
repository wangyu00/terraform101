resource "aws_s3_bucket" "s3_bucket" {
  bucket = "xiaopo-terraform-state"
  region = "ap-southeast-1"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }
}
