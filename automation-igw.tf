resource "aws_internet_gateway" "week5" {
  vpc_id = aws_vpc.week5.id

  tags = {
    Name = "week5"
  }
}
