variable "common_cidr" {
  description = "Common CIDR range for VPC, RDS, and S3"
  type        = string
  default     = "10.0.0.0/16"  # CIDR range
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the private subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_private_subnet1" {
  description = "Availability zone for private subnet 1"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_private_subnet2" {
  description = "Availability zone for private subnet 2"
  type        = string
  default     = "ap-south-1b"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-testterra-bucket"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance"
  type        = number
  default     = 20
}
#acm_certificate variables
/* variable "domain_name" {
  description = "The domain name for the SSL certificate."
  type        = string
}

variable "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone for DNS validation."
  type        = string
} */

# Variable for the name of the ELB security group
variable "elb_security_group_name" {
  description = "Name of the ELB security group"
  type        = string
  default     = "elb-security-group"
}
variable "jenkins_security_group_name" {
  description = "Name of the Jenkins security group"
  type        = string
  default     = "jenkins-security-group"  # You can provide a default value or leave it empty
}


