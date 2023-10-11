output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}
output "private_subnet1_id" {
  description = "ID of the created private subnet"
  value       = aws_subnet.private_subnet1.id
}
output "private_subnet2_id" {
  description = "ID of the created private subnet"
  value       = aws_subnet.private_subnet2.id
}
output "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = "example-subnet-group"
}
