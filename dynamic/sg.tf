resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
    CReated_by = "Dhatri Venuturla"
  }

    egress {
        from_port        =0
        to_port          = 0
        protocol         =-1
        cidr_blocks      = ["0.0.0.0/0"]
    }

    dynamic ingress {
        for_each = var.inbound
        content {
          from_port        = ingress.value["port"]
          to_port          = ingress.value["port"]
          protocol         = ingress.value["protocol"]
          cidr_blocks      = ingress.value["cidr_blocks"]
        }
        
    }
}