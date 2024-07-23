resource "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
  
}