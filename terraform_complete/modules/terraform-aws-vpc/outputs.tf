output "vpc_id" {
    value = local.vpc_id  
}

output "igw_id" {
    value = local.igw_id  
}

output "azs" {
    value = local.azs  
}

output "public_subnet_id" {
    value = aws_subnet.public[*].id  
}

output "private_subnet_id" {
    value = aws_subnet.private[*].id  
}

output "database_subnet_id" {
    value = aws_subnet.database[*].id  
}

output "publicRT_id" {
    value = local.publicRT_id  
}

output "eip_id" {
    value = local.eip  
}

output "nat_gateway_id" {
    value = local.nat_gateway_id  
}

output "privateRT_id" {
    value = local.privateRT_id  
}

output "databaseRT_id" {
    value = local.databaseRT_id  
}