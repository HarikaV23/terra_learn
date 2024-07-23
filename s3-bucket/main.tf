
resource "aws_s3_bucket" "bucket56789" {
  bucket = "bucket9033j2hs"
    tags = {
      Name        = "MyS3Bucket"
      Environment = "Production"
    }
}
resource "aws_s3_bucket_acl" "ACL" {
  bucket = aws_s3_bucket.bucket56789.id
  acl    = "private"
}