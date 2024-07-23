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


variable "instances" {
    default = {
        frontend = {
            name = "frontend"
            type = "t2.micro"
        }
        user = {
            name = "user"
            type = "t2.micro"
        }
        catalouge = {
            name = "catalouge"
            type = "t2.micro"
        }
    }
  
}