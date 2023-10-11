module "vpc" {
  source = "../vpc" 

  vpc_cidr  = "10.0.0.0/16"   # VPC CIDR 
  private_subnet1_cidr = "10.0.1.0/24"   # Subnet CIDR 
  private_subnet2_cidr  = "10.0.2.0/24" 
  availability_zone_private_subnet1 = "ap-south-1a"   # Availability Zone 
  availability_zone_private_subnet2 = "ap-south-1b"
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

resource "aws_lb" "example_alb" {
  name               = "example-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [module.vpc.private_subnet1_id,module.vpc.private_subnet2_id]
  enable_deletion_protection = false
  security_groups    = [aws_security_group.elb_security_group.id]
}
resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type    = "text/plain"
      status_code     = "200"
      
    }
  }
}
