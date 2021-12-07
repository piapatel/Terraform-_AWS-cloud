resource "aws_internet_gateway" "week12" {
  vpc_id = aws_vpc.week12.id

  tags = {
    Name = "week12"
  }
}
