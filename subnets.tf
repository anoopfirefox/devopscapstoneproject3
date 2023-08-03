resource "aws_subnet" "capstonesubnet_a" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "capstonesubnet_a"
  }
}
resource "aws_subnet" "capstonesubnet_b" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "capstonesubnet_b"
  }
}
resource "aws_subnet" "capstonesubnet_c" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-2c"
  tags = {
    Name = "capstonesubnet_c"
  }
}