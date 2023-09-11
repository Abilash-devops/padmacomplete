resource "aws_instance" "abiterraform" {
  for_each = var.instance_name
  ami           = local.ami
  instance_type = each.value
  security_groups = [aws_security_group.abiterraform.name]
  key_name = aws_key_pair.abiterraform.key_name
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.abiterraform
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}

resource "aws_key_pair" "abiterraform" {
  key_name   = "abiterraform-key"
  public_key = local.public_key
}