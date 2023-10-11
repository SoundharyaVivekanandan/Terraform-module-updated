variable "elb_security_group_name" {
  description = "Name of the ELB security group"
  type        = string
   default     = "elb-security-group"
}

variable "common_cidr" {
  description = "Common CIDR range for VPC, RDS, and S3"
  type        = string
}
# variables.tf

# Variable for the name of the ELB security group
/* variable "elb_security_group_name" {
  description = "Name of the ELB security group"
  type        = string
  default     = "elb-security-group"  # You can provide a default value or leave it empty
} */
variable "elb_security_group_id" {
  description = "ID of the security group associated with the ALB (ELB)"
  type        = string
}

# Variable for the port Jenkins is running on
variable "jenkins_port" {
  description = "Port on which Jenkins is running"
  type        = number
  default     = 8080  # Update this to match the port Jenkins is running on
}

# Variable for the source security group ID
/* variable "elb_security_group_id" {
  description = "ID of the security group associated with the ALB (ELB)"
  type        = string
} */
variable "jenkins_security_group_name" {
  description = "Name of the Jenkins security group"
  type        = string
  default     = "jenkins-security-group"
}

