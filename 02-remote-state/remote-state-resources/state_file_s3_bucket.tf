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

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    sid = "allow_access_for_accounts"
    effect = "Allow"
    actions = [
      "s3:*"
    ]

    resources = [
      "*"
    ]
  }
}
