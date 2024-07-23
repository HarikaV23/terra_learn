module "ec2" {
    for_each             = var.instances
    source               = "./ec2"
    component            = each.value["name"]
    instance_type        = each.value["type"]
    
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