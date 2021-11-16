resource "aws_s3_bucket" "ece592-week7-patelpr" {
  bucket = "ece592-week7-patelpr"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.a.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = "ece592-week7-patelpr"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
  lifecycle_rule {
    enabled = true

    expiration {
      days = 30
    }
  }

}
#connect s3 and lambda
resource "aws_lambda_permission" "week7-bucket-lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.ece592-week7-patelpr.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.ece592-week7-patelpr.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
