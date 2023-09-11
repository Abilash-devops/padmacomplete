variable "region" {
    type = string
    default = "us-east-1"  
}

variable "sg_name" {
    type = string
    default = "project"  
}

variable "ingress" {
    type = list
    default = [
        {
        description     = "allow 443 port"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]  
        },
        {
        description      = "allow 80 port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]  
        },
        {
        description      = "allow 22 port"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
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
        redis   = "t2.micro"
    }
}

variable "zone_id" {
  type = string
  default = "Z05900492SKJC57XITYE4"
}

variable "domain" {
  type = string
  default = "padmasrikanth.tech"
}






