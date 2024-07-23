

provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "b" {
  bucket = "bucket9033j2hs"


    tags = {
      Name        = "catyeneet"
     
    }

}
 


terraform {
  backend "s3" {
    bucket         = "bucket9033j2hs"
    key            = "23/07/2024/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}


resource "aws_instance" "web3" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.nano"
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
    tags = {
        Name ="test2"
    }
  
}