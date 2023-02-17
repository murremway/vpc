#Define External IP 
resource "aws_eip" "YOUR_DESIRED_NAME-nat" {
  vpc = true
}

resource "aws_nat_gateway" "YOUR_DESIRED_NAME-nat-gw" {
  allocation_id = aws_eip.YOUR_DESIRED_NAME-nat.id
  subnet_id     = aws_subnet.YOUR_DESIRED_NAMEvpc-public-1.id
  depends_on    = [aws_internet_gateway.YOUR_DESIRED_NAME-gw]
}

resource "aws_route_table" "YOUR_DESIRED_NAME-private" {
  vpc_id = aws_vpc.YOUR_DESIRED_NAMEvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.YOUR_DESIRED_NAME-nat-gw.id
  }

  tags = {
    Name = "YOUR_DESIRED_NAME-private"
  }
}

# route associations private
resource "aws_route_table_association" "level-private-1-a" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAMEvpc-private-1.id
  route_table_id = aws_route_table.YOUR_DESIRED_NAME-private.id
}

resource "aws_route_table_association" "level-private-1-b" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAMEvpc-private-2.id
  route_table_id = aws_route_table.YOUR_DESIRED_NAME-private.id
}

resource "aws_route_table_association" "level-private-1-c" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAMEvpc-private-3.id
  route_table_id = aws_route_table.YOUR_DESIRED_NAME-private.id
}
