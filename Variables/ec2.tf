#Preference of execution
#1st command line varibles (i.e. terraform apply -var="intance_type=t3.medium")
#2nd tfvars (i.e. terraform apply -var-file='test.tfvars')
#3rd Environment variable (i.e. export TF_VAR_instance_type=t3.large)
#4th default variables


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
  ami           = var.ami_id
  instance_type = var.server_size
  vpc_security_group_ids= [aws_security_group.allow_all.id]

  tags = var.tag
}

