data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

/*resource "aws_instance" "week11-vm" {
  ami                         = "ami-02e136e904f3da870"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.week_9_us_east_1b.id
  vpc_security_group_ids      = [aws_security_group.week11.id]
  key_name                    = "ECE592"
  associate_public_ip_address = true
  tags = {
    Name = "week11-bastion-vm"
  }

}*/
# ec2 instance called worker
resource "aws_instance" "week11-worker-vm" {
  ami                    = "ami-0168b9285893a7395"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.week11-pri-a.id
  vpc_security_group_ids = [aws_security_group.week11_ssh_pri_sg.id]
  key_name               = "ECE592"
  user_data = file("cloudinit.txt")

  tags = {
    Name = "week11-worker-vm"
  }
  iam_instance_profile = aws_iam_instance_profile.week11-profile.name
}

resource "aws_iam_instance_profile" "week11-profile" {
  name = "week11-profile"
  role = aws_iam_role.week11-role.name
  tags = {}
}
