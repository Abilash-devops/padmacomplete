locals {
    vpc_id = aws_vpc.main.id
    igw_id = aws_internet_gateway.main.id
    public_subnet_id = aws_subnet.public.id
    publicRT_id = aws_route_table.publicRT.id
    ami = data.aws_ami.latest_ami.id
    sg_id = aws_security_group.main.id
    public_key = file("${path.module}/main.pub")
}