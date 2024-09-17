variable "instance_name" {
  default=["db","backend","frontend"]
}
variable "common_tags" {
    default = {
      "Project" = "Expense"
      "CreatedBy" = "Dhatri"
      "Environment" = "Practice"
      "terraform"=true
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