data "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
  
}


output "sample" {
    value  = aws_instance.web.instance_type
  
}