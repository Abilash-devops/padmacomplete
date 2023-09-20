variable "cidr_block" {     
}

variable "common_tags" {
    default = {}  
}

variable "project_name" {  
}

variable "vpc_tags" {
    default = {
        Name = "roboshop-vpc" 
    } 
}

variable "igw_tags" {
    default = {
        Name = "roboshop-igw" 
    } 
}

variable "public_cidr_block" {
    type = list 
    validation {
        condition = length(var.public_cidr_block) == 2
        error_message = "Please launch 2 public subnets"
    }    
}

variable "private_cidr_block" {
    type = list 
    validation {
        condition = length(var.private_cidr_block) == 2
        error_message = "Please launch 2 private subnets"
    }    
}

variable "database_cidr_block" {
    type = list 
    validation {
        condition = length(var.database_cidr_block) == 2
        error_message = "Please launch 2 database subnets"
    }    
}

variable "nat_gateway_tags" {
    default = {
        Name = "roboshop-natgw"
    }
  
}


