resource "aws_internet_gateway" "capstone_igw" {
  vpc_id = aws_vpc.devops_vpc.id
  tags = {
    Name = "capstone-igw"
  }
}