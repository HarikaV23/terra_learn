data "aws_ami" "web" {
    most_recent = true
    name_regex  = "Centos-8-DevOps-Practice"
    owners      = ["973714476881"]
  
}

resource "aws_instance" "ec2" {
    ami                    = "ami-0b4f379183e5706b9"
    instance_type          = var.instance_type
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
    tags = {
        Name = var.component
    }
  
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}



variable "component" {}
variable "instance_type" {}

