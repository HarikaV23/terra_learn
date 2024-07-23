
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC"
  }
}


resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet"
  }
}




resource "aws_instance" "ec2" {
    for_each = var.component
    subnet_id = aws_subnet.my_subnet.id
    ami = "ami-0b4f379183e5706b9"
    instance_type = each.value["type"]
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
    tags = {
        Name =  each.value["name"]
    }
  
}


  


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.my_vpc.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


#resource "aws_route53_record" "www" {
 # zone_id = aws_route53_zone.primary.zone_id
  #name    = "www.example.com"
  #type    = "A"
  #ttl     = 30
  #records = [aws_instance.ec2.private_ip]
#}



variable "component" {}
variable "instance_type" {}



