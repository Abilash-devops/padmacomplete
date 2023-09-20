locals {
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  database_subnet_id = module.vpc.database_subnet_id
  sg_id = module.main.sg_id
  ami = data.aws_ami.devops_ami.id
  ips = module.ec2_instance
  user_data = file("roboshop-ansible.sh")
}