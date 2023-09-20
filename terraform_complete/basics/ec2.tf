resource "aws_instance" "main" {
    for_each = var.instance_name
    ami           = local.ami
    instance_type = each.value
    subnet_id = local.public_subnet_id
    # security_groups = aws_security_group.main.name
    vpc_security_group_ids = [local.sg_id]
    key_name = aws_key_pair.main.key_name
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "main" {
  for_each = aws_instance.main
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}

resource "aws_key_pair" "main" {
  key_name   = "main-key"
  public_key = local.public_key
}