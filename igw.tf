resource "aws_internet_gateway" "week10" {
  vpc_id = aws_vpc.week10.id

  tags = {
    Name = "week10"
  }
}
