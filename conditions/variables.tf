variable "ami_id" {
    type=string
    default="ami-090252cbe067a9e58"
}

variable "instance_name" { 
default = ["DB","BackEnd","FrontEnd"]
}


variable "common_tags" {
    default = {
      "Project" = "Expense"
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