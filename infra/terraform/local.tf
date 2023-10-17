data "aws_secretsmanager_secret" "mixfast_secret_value" {
  arn = "arn:aws:secretsmanager:us-east-2:022874923015:secret:mixfast-secrets-manager-ouugeG"
}

data "aws_secretsmanager_secret_version" "mixfast_secret_version" {
  secret_id = data.aws_secretsmanager_secret.mixfast_secret_value.arn
}

locals {
  mixfast_db_password = jsondecode(data.aws_secretsmanager_secret_version.mixfast_secret_version.secret_string)
}