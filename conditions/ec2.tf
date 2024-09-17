resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
    Created_by = "Dhatri Venuturla"
  }
    #this is block
    egress {
        from_port        =var.outbound["port"]
        to_port          = var.outbound["port"]
        protocol         = var.outbound["protocol"]
        cidr_blocks      = var.outbound["cidr_blocks"]
    }

    ingress {
        from_port        = var.inbound["port"]
        to_port          =var.inbound["port"]
        protocol         = var.inbound["protocol"]
        cidr_blocks      = var.inbound["cidr_blocks"]
    }
}


resource "aws_instance" "Server" {
  count = length(var.instance_name)
  ami           = var.ami_id
  instance_type = var.instance_name[count.index]=="DB"?"t3.small":"t3.micro"
  vpc_security_group_ids= [aws_security_group.allow_all.id]

  tags = merge(var.common_tags,
  {
    Name=var.instance_name[count.index]
  })
}

