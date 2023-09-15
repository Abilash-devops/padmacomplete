variable "region" {
    default = "us-east-1"  
}

variable "cidr_block" {
    default = "10.0.0.0/16"  
}

variable "project_name" {
    default = "roboshop"  
}

variable "common_tags" {
    default = {
        Name = "Roboshop"
        Env  = "Dev"
        Terraform = "True"
    }
}

variable "public_cidr_block" {
    default = ["10.0.1.0/24","10.0.2.0/24"]  
}

variable "private_cidr_block" {
    default = ["10.0.11.0/24","10.0.12.0/24"]  
}

variable "database_cidr_block" {
    default = ["10.0.21.0/24","10.0.22.0/24"]  
}

