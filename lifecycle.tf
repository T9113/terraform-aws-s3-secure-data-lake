resource "aws_s3_bucket_lifecycle_configuration" "tiering" {
  bucket = aws_s3_bucket.data_lake.id
  rule {
    id     = "archive-raw-data"
    status = "Enabled"
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
