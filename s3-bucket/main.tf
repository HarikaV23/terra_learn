

provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "b" {
  bucket = "bucket9033j2hs"


    tags = {
      Name        = "catyeneet"
     
    }

}
 


