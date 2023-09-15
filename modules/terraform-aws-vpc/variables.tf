variable "cidr_block" {
}

variable "common_tags" {
    default = {}  
}

variable "project_name" {    
}

variable "enable_dns_hostnames" {
    default = "true"  
}

variable "enable_dns_support" {
    default = "true"  
}

variable "vpc_tags" {
    default = {
        Name = "Roboshop-vpc"
    }  
}

variable "igw_tags" {
    default = {
        Name = "Roboshop-igw"
    }  
}

variable "public_cidr_block" {
    type = list 
    validation {
      condition = length(var.public_cidr_block) == 2
      error_message = "Please use 2 subnets"
    }
}

variable "private_cidr_block" {
    type = list 
    validation {
      condition = length(var.private_cidr_block) == 2
      error_message = "Please use 2 subnets"
    }
}

variable "database_cidr_block" {
    type = list 
    validation {
      condition = length(var.database_cidr_block) == 2
      error_message = "Please use 2 subnets"
    }
}

variable "nat_gateway_tags" {
    default = {
        Name = "roboshop-natgw"   
    }
}

variable "db_subnet_group_tags" {
    default = {
        Name = "roboshop-subnet"
    }
  
}