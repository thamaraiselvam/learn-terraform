resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.main_public_a.id
  depends_on = [aws_internet_gateway.main_gw]
}

resource "aws_route_table" "main_private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "main_private_a" {
  subnet_id = aws_subnet.main_private_a.id
  route_table_id  = aws_route_table.main_private.id
}


resource "aws_route_table_association" "main_private_b" {
  subnet_id = aws_subnet.main_private_b.id
  route_table_id  = aws_route_table.main_private.id
}


resource "aws_route_table_association" "main_private_c" {
  subnet_id = aws_subnet.main_private_c.id
  route_table_id  = aws_route_table.main_private.id
}