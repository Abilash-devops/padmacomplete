output "vpc_id" {
    value = module.vpc.vpc_id  
}

output "igw_id" {
    value = module.vpc.igw_id  
}

output "azs" {
    value = module.vpc.azs  
}

output "public_subnet_id" {
    value = local.public_subnet_id  
}

output "private_subnet_id" {
    value = local.private_subnet_id  
}

output "database_subnet_id" {
    value = local.database_subnet_id  
}

output "publicRT_id" {
    value = module.vpc.publicRT_id  
}

output "eip_id" {
    value = module.vpc.eip_id  
}

output "nat_gateway_id" {
    value = module.vpc.nat_gateway_id  
}

output "privateRT_id" {
    value = module.vpc.privateRT_id  
}

output "databaseRT_id" {
    value = module.vpc.databaseRT_id  
}

output "sg_id" {
    value = local.sg_id  
}

output "ami_id" {
    value = local.ami  
}





