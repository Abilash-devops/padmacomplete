locals {
  ami = data.aws_ami.latest_ami.id  
  public_key = file("${path.module}/project.pub")
}

# instance_type = var.aws_instancename[count.index] == "mongodb" || var.aws_instancename[count.index] == "mysql" ? "t3.micro" : "t2.micro"