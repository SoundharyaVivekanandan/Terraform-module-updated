provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5DG47IVSQCP6LBLZ"
  secret_key = "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"
}
module "vpc" {
  source                          = "./vpc"
  vpc_cidr                        = var.vpc_cidr
  private_subnet1_cidr            = var.private_subnet1_cidr
  private_subnet2_cidr            = var.private_subnet2_cidr
  availability_zone_private_subnet1 = var.availability_zone_private_subnet1
  availability_zone_private_subnet2 = var.availability_zone_private_subnet2
}


module "s3" {
  source           = "./s3"
  s3_bucket_name   = var.s3_bucket_name
}

module "rds" {
  source              = "./rds"
  db_allocated_storage = var.db_allocated_storage
}
  module "load_balancer" {
  source              = "./load_balancer"  # Update the source path as needed
  elb_security_group_id = aws_security_group.elb_security_group.id
  common_cidr         = var.common_cidr  # Pass the common_cidr variable to the load_balancer module
  # Other module configurations
}
resource "aws_security_group" "elb_security_group" {
  name        = var.elb_security_group_name
  description = "Security group for ELB"
  vpc_id      =  module.vpc.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.common_cidr]
  }
}
resource "aws_security_group" "jenkins_security_group" {
  name        = "jenkins-security-group"
  description = "Security group for Jenkins instance"
  vpc_id      = module.vpc.vpc_id

  # Add your other security group settings here, such as egress rules.
}

# Add the ingress rule for ALB access to Jenkins
resource "aws_security_group_rule" "jenkins_ingress" {
  type        = "ingress"
  from_port   = 8080  # Update this to match the port Jenkins is running on
  to_port     = 8080
  protocol    = "tcp"
  source_security_group_id = aws_security_group.elb_security_group.id
  security_group_id        = aws_security_group.jenkins_security_group.id
}


/* module "acm_certificate" {
  source = "./acm_certificate"
  
  domain_name    = var.domain_name
  route53_zone_id = var.route53_zone_id
} */


