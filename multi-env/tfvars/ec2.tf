# resource "aws_security_group" "allow_all" {
#   name        = "allow_all"
#   description = "Allow all inbound traffic and all outbound traffic"

#   tags = {
#     Name = "allow_all"
#     CReated_by = "Dhatri Venuturla"
#   }

#     egress {
#         from_port        =0
#         to_port          = 0
#         protocol         =-1
#         cidr_blocks      = ["0.0.0.0/0"]
#     }

#     ingress {
#         from_port        = 22
#         to_port          =22
#         protocol         = "TCP"
#         cidr_blocks      = ["0.0.0.0/0"]
#     }
# }


resource "aws_instance" "expense" {
  for_each = var.instance_name
  ami = data.aws_ami.ami_id.id
  instance_type = each.value
  vpc_security_group_ids= ["sg-0e8f245c385adc70a"]


  tags = merge(var.common_tags,
    {
      "Environment" = var.environment
      "Name"=each.key
      "Module"=each.key
      "Project" = "Expense-${var.environment}"
    }
    )

}

