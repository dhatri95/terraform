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

    ingress {
        from_port        = 22
        to_port          =22
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "Server" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t3.micro"
  vpc_security_group_ids= [aws_security_group.allow_all.id]


  tags = {
    Name = "Server"
  }
}

