resource "aws_secretsmanager_secret" "user" {
  name = "user"
  description = "My user"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "user" {
  secret_id     = aws_secretsmanager_secret.user.id
  secret_string = "admin"
}

resource "aws_secretsmanager_secret" "pass" {
  name = "pass"
  description = "My pass"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "pass" {
  secret_id     = aws_secretsmanager_secret.pass.id
  secret_string = "Gfhjkm123"
}

resource "aws_secretsmanager_secret" "endpoint" {
  name = "endpoint"
  description = "DB endpoint"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "endpoint" {
  secret_id     = aws_secretsmanager_secret.endpoint.id
  secret_string = "userdata.cisuykwqiuje.eu-central-1.rds.amazonaws.com:3306"
}
