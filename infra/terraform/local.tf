data "aws_secretsmanager_secret" "mixfast_secret_value" {
  arn = "arn:aws:secretsmanager:us-east-1:211125470560:secret:mixfast_secrets_manager-Opmjtp"
}

data "aws_secretsmanager_secret_version" "mixfast_secret_version" {
  secret_id = data.aws_secretsmanager_secret.mixfast_secret_value.arn
}

locals {
  mixfast_db_password = jsondecode(data.aws_secretsmanager_secret_version.mixfast_secret_version.secret_string)
}