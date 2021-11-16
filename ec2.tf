data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

/*resource "aws_instance" "week10-vm" {
  ami                         = "ami-02e136e904f3da870"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.week_9_us_east_1b.id
  vpc_security_group_ids      = [aws_security_group.week10.id]
  key_name                    = "ECE592"
  associate_public_ip_address = true
  tags = {
    Name = "week10-bastion-vm"
  }

}*/
# ec2 instance called worker
resource "aws_instance" "week10-worker-vm" {
  ami                    = "ami-02e136e904f3da870"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.week10-pri-a.id
  vpc_security_group_ids = [aws_security_group.week10_ssh_pri_sg.id]
  key_name               = "ECE592"

  tags = {
    Name = "week10-worker-vm"
  }
  iam_instance_profile = aws_iam_instance_profile.week10-profile.name
}

resource "aws_iam_instance_profile" "week10-profile" {
  name = "week10-profile"
  role = aws_iam_role.week10-role.name
  tags = {}
}
