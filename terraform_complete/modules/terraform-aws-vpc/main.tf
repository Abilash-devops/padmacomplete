resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.vpc_tags
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.igw_tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr_block)
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = local.azs[count.index]

  tags =  merge(
    var.common_tags,
    {
        Name = "${var.project_name}-public-${local.azs[count.index]}"
    }
   )
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = local.azs[count.index]

  tags =  merge(
    var.common_tags,
    {
        Name = "${var.project_name}-private-${local.azs[count.index]}"
    }
   )
}

resource "aws_subnet" "database" {
  count = length(var.database_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_cidr_block[count.index]
  availability_zone = local.azs[count.index]

  tags =  merge(
    var.common_tags,
    {
        Name = "${var.project_name}-database-${local.azs[count.index]}"
    }
   )
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-publicRT"
    }
   )
}

resource "aws_eip" "eip" {
    domain   = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.nat_gateway_tags
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-privateRT"
    }
   )
}

resource "aws_route_table" "databaseRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-databaseRT"
    }
   )
}

resource "aws_route_table_association" "public" {
  count = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.privateRT.id
}

resource "aws_route_table_association" "database" {
  count = length(var.database_cidr_block)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.databaseRT.id
}