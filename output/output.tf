data "aws_ami" "web" {
    most_recent = true
    name_regex = "Centos-8-DevOps-Practice"
    owners = ["973714476881"]
  
}


output "sample" {
    value  = data.aws_ami.web.image_id
  
}