data "aws_ami" "web" {
    most_recent = true
    name_regex = "Centos-8-DevOps-Practice"
    owners = ["973714476881"]
  
}

data "aws_instance" "web1" {
    ami = "ami-0b4f379183e5706b9"
}



output "sample" {
    
    value  = data.aws_instance.web1.instance_type
  
}




output "sample1" {
    
    value  = data.aws_ami.web.image_id
  
}