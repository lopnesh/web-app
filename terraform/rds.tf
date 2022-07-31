resource "aws_db_subnet_group" "production" {
  name       = "main"
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}

resource "aws_db_instance" "production" {
  identifier              = "production"
  db_name                    = "userdata"
  username                = aws_secretsmanager_secret_version.user.secret_string
  password                = aws_secretsmanager_secret_version.pass.secret_string
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  allocated_storage       = "10"
  storage_encrypted       = false
  vpc_security_group_ids  = [aws_security_group.rds.id]
  db_subnet_group_name    = aws_db_subnet_group.production.name
  multi_az                = false
  publicly_accessible     = true
  skip_final_snapshot     = true
}
