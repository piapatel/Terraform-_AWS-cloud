resource "aws_vpc" "week9" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "week9"
  }
}

