resource "aws_instance" "Server" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t3.micro"
  vpc_security_group_ids= ["sg-0e8f245c385adc70a"]
  # here self is aws_instance.server
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  tags = {
    Name = "Server"
  }
}

