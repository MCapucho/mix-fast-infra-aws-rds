resource "aws_db_subnet_group" "mixfast_rds_subnet_private" {
  name       = "${var.name}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_security_group" "mixfast_rds_security_group" {
  name        = "${var.name}-rds-security-group"
  description = "Grupo de seguranca do banco de dados mixfast"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_db_instance" "mixfast_rds" {
  db_name                     = var.database_name
  allocated_storage           = var.allocated_storage
  storage_type                = var.storage_type
  engine                      = var.engine
  instance_class              = var.instance_class
  allow_major_version_upgrade = true
  username                    = var.username
  password                    = local.mixfast_db_password.dbpassword
  port                        = var.port
  identifier                  = var.identifier
  parameter_group_name        = var.parameter_group_name
  skip_final_snapshot         = var.skip_final_snapshot
  publicly_accessible         = false

  db_subnet_group_name        = aws_db_subnet_group.mixfast_rds_subnet_private.id
  vpc_security_group_ids      = [aws_security_group.mixfast_rds_security_group.id]

  tags = var.tags
}