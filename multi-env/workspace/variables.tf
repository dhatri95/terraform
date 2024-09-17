variable "instance_name" {
    type = map
    default = {
        "dev"="t3.micro"
        "prod"="t3.small"
        
    }
  
}