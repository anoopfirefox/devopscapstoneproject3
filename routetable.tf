resource "aws_route_table" "capstone_rt" {
  vpc_id = aws_vpc.devops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.capstone_igw.id
  }
  tags = {
    Name = "Capstone-rt"
  }
}
resource "aws_route_table_association" "capstone_rt1" {
  subnet_id      = aws_subnet.capstonesubnet_a.id
  route_table_id = aws_route_table.capstone_rt.id
}
resource "aws_route_table_association" "capstone_rt2" {
  subnet_id      = aws_subnet.capstonesubnet_b.id
  route_table_id = aws_route_table.capstone_rt.id
}
resource "aws_route_table_association" "capstone_rt3" {
  subnet_id      = aws_subnet.capstonesubnet_c.id
  route_table_id = aws_route_table.capstone_rt.id
}