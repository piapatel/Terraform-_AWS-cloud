resource "aws_subnet" "week_10_us_east_1a" {
  vpc_id                  = aws_vpc.week11.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "week11-sub-a"
  }
}
resource "aws_subnet" "week_10_us_east_1b" {
  vpc_id                  = aws_vpc.week11.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "week11-sub-b"
  }
}
resource "aws_subnet" "week11-pri-a" {
  vpc_id                  = aws_vpc.week11.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "week11-pri-a"
  }
}
resource "aws_subnet" "week11-pri-b" {
  vpc_id                  = aws_vpc.week11.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "week11-pri-b"
  }
}
