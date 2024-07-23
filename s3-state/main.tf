terraform {
  backend "s3" {
    bucket         = "terraform-b71"
    key            = "s3-state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  
  }
}

resource "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.nano"
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
    tags = {
        Name ="test"
    }
  
}


resource "aws_s3_bucket" "my_buk" {
  bucket = "my-tf-test-bucket"
  region         = "us-east-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}