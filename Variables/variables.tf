variable "ami_id" {
    type=string
    default="ami-090252cbe067a9e58"
}

variable "server_size" {
    type= string
    default = "t3.micro"
}

variable "tag" {
    type = map(string)
    default = {
      "Project" = "Vars_demo"
      "CreatedBy" = "Dhatri"
      "Environment" = "Practice"
    }
}

variable inbound {
    default =         {
        "port"       = 22
        "protocol"         = "TCP"
        "cidr_blocks"      = ["0.0.0.0/0"]
    }
}

variable outbound {
    default =         {
        "port"       = 0
        "protocol"         = -1
        "cidr_blocks"      = ["0.0.0.0/0"]
    }
}