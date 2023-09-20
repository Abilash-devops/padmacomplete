locals {
  vpc_id = aws_vpc.main.id
  igw_id = aws_internet_gateway.main.id
  azs = slice(data.aws_availability_zones.available.names,0,2)
  publicRT_id = aws_route_table.publicRT.id
  eip = aws_eip.eip.id
  nat_gateway_id = aws_nat_gateway.main.id
  privateRT_id = aws_route_table.privateRT.id
  databaseRT_id = aws_route_table.databaseRT.id
}
