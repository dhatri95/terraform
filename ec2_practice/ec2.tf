resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = {
    Name = "allow_tls"
    CreatedByTerraform= "true"
    CreatedById= "Dhatri"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "TCP"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "Test" {
  ami           = "ami-031d574cddc5bb371" 
  instance_type = "t3.micro"
  #vpc_security_group_ids = [aws_security_group.allow_tls.id]
  security_groups = [aws_security_group.allow_tls.name]
}
