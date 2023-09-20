variable "region" {
    default = "us-east-1"  
}

variable "sg_name" {
    default = "main"  
}

variable "sg_description" {
    default = "allow 80,443 and 22"  
}

variable "sg_ingress" {
    type = list
    default = [
        {
            description      = "Allow 443 port"
            from_port        = 443
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow 80 port"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow 22 port"
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
        catalogue = "t2.micro"
        redis   = "t2.micro"
        rabbitmq = "t2.micro"
        user    = "t2.micro"
        payment = "t2.micro"
        shipping = "t2.micro"
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