data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

/*resource "aws_instance" "week12-vm" {
  ami                         = "ami-02e136e904f3da870"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.week_9_us_east_1b.id
  vpc_security_group_ids      = [aws_security_group.week12.id]
  key_name                    = "ECE592"
  associate_public_ip_address = true
  tags = {
    Name = "week12-bastion-vm"
  }

}*/

