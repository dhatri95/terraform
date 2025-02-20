resource "aws_route53_record" "r53_records" {
    count = length(var.instance_name)
    zone_id = var.zone_id 
    name    = var.instance_name[count.index]=="frontend"? var.domain_name:"${var.instance_name[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 300
    records = var.instance_name[count.index]=="frontend"? [aws_instance.expense[count.index].public_ip]:[aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}