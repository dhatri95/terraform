
variable inbound {
    default =         [{
        "port"       = 22
        "protocol"         = "TCP"
        "cidr_blocks"      = ["0.0.0.0/0"]
    },
    {
        "port"       = 80
        "protocol"         = "TCP"
        "cidr_blocks"      = ["0.0.0.0/0"]
    },
    {
        "port"       = 8080
        "protocol"         = "TCP"
        "cidr_blocks"      = ["0.0.0.0/0"]
    },
    {
        "port"       = 3306
        "protocol"         = "TCP"
        "cidr_blocks"      = ["0.0.0.0/0"]
    }
    ]
}

variable outbound {
    default =         {
        "port"       = 0
        "protocol"         = -1
        "cidr_blocks"      = ["0.0.0.0/0"]
    }
}
