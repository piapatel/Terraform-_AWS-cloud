resource "aws_internet_gateway" "week9" {
  vpc_id = aws_vpc.week9.id

  tags = {
    Name = "week9"
  }
}
