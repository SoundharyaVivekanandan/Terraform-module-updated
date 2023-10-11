output "elb_dns_name" {
  description = "DNS name of the created Elastic Load Balancer"
  value       = aws_lb.example_alb.dns_name
}
output "jenkins_security_group_id" {
  description = "ID of the Jenkins security group"
  value       = aws_security_group.jenkins_security_group.id
}

