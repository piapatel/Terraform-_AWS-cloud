resource "aws_security_group" "week10_ssh_pri_sg" {
  name        = "week10_ssh_pri_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.week10.id
  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.week10.id]
      self             = false
    }
  ]
  egress = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  tags = {
    Name = "week10_ssh_pri_sg"
  }
}
