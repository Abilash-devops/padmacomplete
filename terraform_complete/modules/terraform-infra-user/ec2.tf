module "ec2_instance" {
  for_each = var.instance_name
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = local.ami
  instance_type          = each.value
  vpc_security_group_ids = [local.sg_id]
  subnet_id              = each.key == "web" ? local.public_subnet_id[0] : local.private_subnet_id[0]
  tags = merge(
    var.common_tags,
    {
        Name = each.key
    }
  )
}

module "ec2_ansible1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = local.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [local.sg_id]
  subnet_id = local.public_subnet_id[0]
  user_data = local.user_data
  tags = merge(
    {
        Name = "Ansible"
    },
    var.common_tags
  )
}

