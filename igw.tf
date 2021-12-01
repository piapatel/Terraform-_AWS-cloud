resource "aws_internet_gateway" "week11" {
  vpc_id = aws_vpc.week11.id

  tags = {
    Name = "week11"
  }
}
