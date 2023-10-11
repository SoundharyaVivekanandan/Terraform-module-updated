output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnet1_id" {
  value = module.vpc.private_subnet1_id
}
output "private_subnet2_id" {
  value = module.vpc.private_subnet2_id
}

output "availability_zone_private_subnet1" {
  value = var.availability_zone_private_subnet1
}
output "availability_zone_private_subnet2" {
  value = var.availability_zone_private_subnet2
}
/* output "certificate_arn" {
  value = module.acm_certificate.certificate_arn
} */

output "s3_bucket_name" {
  value = module.s3.s3_bucket_name
}

output "rds_instance_id" {
  value = module.rds.db_instance_id
}
output "elb_dns_name" {
  value = module.load_balancer.elb_dns_name
}
output "jenkins_security_group_id" {
  description = "ID of the Jenkins security group"
  value       = aws_security_group.jenkins_security_group.id
}

