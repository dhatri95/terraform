
variable "common_tags" {
    default = {
      "CreatedBy" = "Dhatri"
      "terraform" = true
    }
}

variable "instance_name" {
    default = {
    }
  
}

variable "environment" {
    default = {
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

variable "zone_id" {
    default = "Z049152019A8UZ3BRALR8"
}

variable "domain_name" {
    default = "cloudevops.online"
}