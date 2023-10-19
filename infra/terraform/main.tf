resource "aws_db_subnet_group" "mixfast_rds_subnet_private" {
  name        = "${var.name}_rds_subnet_group"
  description = "Grupo de subnet privada do banco de dados mixfast"
  subnet_ids  = var.subnet_ids

  tags = var.tags
}

resource "aws_security_group" "mixfast_rds_security_group" {
  name        = "${var.name}_rds_security_group"
  description = "Grupo de seguranca do banco de dados mixfast"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.from_port_ingress
    to_port     = var.to_port_ingress
    protocol    = var.protocol_ingress
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.from_port_egress
    to_port     = var.to_port_egress
    protocol    = var.protocol_egress
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