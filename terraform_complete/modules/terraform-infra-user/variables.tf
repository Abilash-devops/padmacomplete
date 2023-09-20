variable "cidr_block" {
    default = "10.0.0.0/16"  
}

variable "common_tags" {
    type = map 
    default = {
        Project = "Roboshop"
        Env = "Dev"
        Terraform = "True"
    }  
}

variable "project_name" {
    default = "roboshop"  
}

variable "region" {
    default = "us-east-1"  
}

variable "public_cidr_block" {
    type = list 
    default = ["10.0.1.0/24","10.0.2.0/24"]  
}

variable "private_cidr_block" {
    type = list 
    default = ["10.0.10.0/24","10.0.20.0/24"]  
}

variable "database_cidr_block" {
    type = list 
    default = ["10.0.100.0/24","10.0.200.0/24"]  
}

variable "sg_name" {
    default = "main"  
}

variable "sg_description" {
    default = "allow-all"  
}

variable "sg_ingress" {
    type = list 
    default = [
        {
            description      = "allow all ports"
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]      
        }
    ]
  
}

variable "instance_name" {
    type = map 
    default = {
        mongodb = "t3.micro"
        mysql   = "t3.micro"
        web     = "t2.micro"
        cart    = "t2.micro"
        catalogue = "t2.micro"
        redis   = "t2.micro"
        rabbitmq = "t2.micro"
        user    = "t2.micro"
        payment = "t2.micro"
        shipping = "t2.micro"
    }  
}

variable "zone_name" {
    type = string
    default = "padmasrikanth.tech"  
}
