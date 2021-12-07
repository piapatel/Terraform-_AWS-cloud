resource "aws_rds_cluster" "week12-rds" {
  cluster_identifier      = "week12-rds"
  engine                  = "aurora-mysql"
  engine_mode             = "serverless"
  database_name           = "week12_rds"
  master_username         = "admin"
  master_password         = "secret123"
  skip_final_snapshot     =  true
  db_subnet_group_name    =  aws_db_subnet_group.week12_subnet_group.name
  vpc_security_group_ids = [ aws_security_group.week12-rds-sg.id ]
 scaling_configuration {
  auto_pause      = true
  min_capacity = 1
  max_capacity = 2
  seconds_until_auto_pause = 300  
  }
}
output "week12-rds-endpoint" {
  value = aws_rds_cluster.week12-rds.endpoint
}
