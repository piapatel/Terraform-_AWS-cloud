resource "aws_db_subnet_group" "week12_subnet_group" {
  name       = "week_12_main"
  subnet_ids = [aws_subnet.week12-pri-a.id, aws_subnet.week12-pri-b.id]

  tags = {
    Name = "week-12 subnet group"
  }
}
