resource "aws_cloudtrail" "week8_cloudtrail" {
  # ... other configuration ...
   name                          = "week8_cloudtrail"

   s3_bucket_name                = aws_s3_bucket.cloudtrail-s3.id
   include_global_service_events = true
    is_multi_region_trail         = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }
}

