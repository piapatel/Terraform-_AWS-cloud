resource "aws_launch_template" "week12-bastion-lt" {
  name = "week12-bastion-lt"
  image_id = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name = "ECE592"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.week12.id]
    subnet_id                   = aws_subnet.week_10_us_east_1a.id
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "week12-bastion-vm"
    }
  }

}
