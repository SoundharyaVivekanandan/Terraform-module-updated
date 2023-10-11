output "db_instance_id" {
  description = "ID of the created RDS instance"
  value       = aws_db_instance.main.id
}