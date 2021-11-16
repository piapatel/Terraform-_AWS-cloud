data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "terraform_instance_hw" {
  ami                    = "ami-087c17d1fe0178315"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-053b9eca323537d04"
  vpc_security_group_ids = ["sg-08d79674504215c7c"]
  key_name               = "ECE592"

  tags = {
    Name = "automation-vm"
  }
  iam_instance_profile = aws_iam_instance_profile.automation-profile.name

}
resource "aws_iam_instance_profile" "automation-profile" {
  name = "automation-profile"
  role = aws_iam_role.automation-role.name
  tags = {}

}
