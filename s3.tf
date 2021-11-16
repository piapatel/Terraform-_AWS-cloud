resource "aws_s3_bucket" "ece592-week6-patelpr" {
  bucket = "ece592-week6-patelpr"
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
    Name        = "ece592-week6-patelpr"
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
resource "aws_lambda_permission" "week6-bucket-lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:us-east-1:460496417308:function:week6-lambda"
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.ece592-week6-patelpr.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.ece592-week6-patelpr.id

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:us-east-1:460496417308:function:week6-lambda"
    events              = ["s3:ObjectCreated:*"]
  }
}
