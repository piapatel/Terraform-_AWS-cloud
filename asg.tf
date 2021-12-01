resource "aws_autoscaling_group" "week11-asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  name = "week11-bastion-asg"



  launch_template {
    id      = aws_launch_template.week11-bastion-lt.id
    version = "$Latest"
}

}
