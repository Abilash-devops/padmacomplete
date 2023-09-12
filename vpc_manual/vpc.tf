resource "aws_vpc" "roboshop" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "roboshop"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "roboshop-publicsubnet"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "roboshop-privatesubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "roboshop-igw"
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.roboshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "roboshop-publicRT"
  }
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.roboshop.id
  tags = {
    Name = "roboshop-privateRT"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privateRT.id
}

resource "aws_security_group" "roboshop" {
  name        = "roboshop"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.roboshop.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop"
  }
}

resource "aws_instance" "roboshop" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet.id
  security_groups = [aws_security_group.roboshop.id]
  associate_public_ip_address = true
  tags = {
    Name = "roboshop"
  }
}
