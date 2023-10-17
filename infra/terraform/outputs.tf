output "security_group_id" {
  value       = aws_security_group.mixfast_rds_security_group.id
}

output "db_instance_endpoint" {
  value       = aws_db_instance.mixfast_rds.endpoint
}