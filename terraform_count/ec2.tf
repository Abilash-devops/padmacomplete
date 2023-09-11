resource "aws_instance" "project" {
  count = 5
  ami           = local.ami
  instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" ? "t3.micro" : "t2.micro"
  security_groups = [aws_security_group.project.name]
  key_name = aws_key_pair.project.key_name
  tags = {
    Name = var.instance_name[count.index]
  }
}

resource "aws_route53_record" "www" {
  count = 5
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.project[count.index].private_ip]
}

resource "aws_key_pair" "project" {
  key_name   = "project-key"
  public_key = local.public_key
}