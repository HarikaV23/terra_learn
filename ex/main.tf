data "aws_ami" "web" {
    most_recent = true
    name_regex = "Centos-8-DevOps-Practice"
    owners = ["973714476881"]

}

resource "aws_instance" "web" {
    for_each = var.instances
    ami = data.aws_ami.web.image_id
    instance_type = each.value["type"]
    vpc_security_group_ids = ["sg-0f2cd6b7ac0f58e0e"]
    tags = {
        Name = each.value["name"]
    }
  
}


resource "aws_route53_record" "www" {
  for_each = var.instances
  zone_id = each.value["zoneid"]
  name    = var.instances.private_ip
  type    = "A"
  ttl     = 30
  records = [aws_instance.web.each.value["name"].private_ip]
}

variable "instances" {
    default = {
        frontend = {
            name = "frontend"
            type = "t2.micro"
            zoneid ="Z03841342MEYUTSA07CRA"
        }
        user = {
            name = "user"
            type = "t2.micro"
            zoneid ="Z03841342MEYUTSA07CRA"
        }
        catalouge = {
            name = "catalouge"
            type = "t2.micro"
            zoneid ="Z03841342MEYUTSA07CRA"
        }
    }
  
}