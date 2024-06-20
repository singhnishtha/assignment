output "db_instance_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.rds_instance.id
}