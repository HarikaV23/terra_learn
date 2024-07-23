
resource "aws_s3_bucket" "b" {
  bucket = "bucket9033j2hs"
    tags = {
      Name        = "MyS3Bucket"
      Environment = "Production"
    }
}
