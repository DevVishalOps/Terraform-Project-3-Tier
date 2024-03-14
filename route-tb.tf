resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.route_web_tags
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rtb.id
}

//Adding NAT Gateway into the default main route table
resource "aws_default_route_table" "dfltrtb" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = var.route_db_tags
}