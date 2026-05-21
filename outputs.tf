output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_database_name" {
  value = aws_db_instance.postgres.db_name
}

output "rds_username" {
  value     = aws_db_instance.postgres.username
  sensitive = true
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}
