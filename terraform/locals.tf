locals {
  ami = data.aws_ami.latest_ami.id
  instance_type = var.instance_name == "mongodb" || var.instance_name == "mysql" ? "t3.micro" : "t2.micro"
}