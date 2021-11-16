resource "aws_subnet" "week_10_us_east_1a" {
  vpc_id                  = aws_vpc.week10.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "week10-sub-a"
  }
}
resource "aws_subnet" "week_10_us_east_1b" {
  vpc_id                  = aws_vpc.week10.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "week10-sub-b"
  }
}
resource "aws_subnet" "week10-pri-a" {
  vpc_id                  = aws_vpc.week10.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "week10-pri-a"
  }
}
resource "aws_subnet" "week10-pri-b" {
  vpc_id                  = aws_vpc.week10.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "week10-pri-b"
  }
}
