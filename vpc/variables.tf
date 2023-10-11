variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "private_subnet2_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone_private_subnet1" {
  description = "Availability zone for the private subnet"
  type        = string
}
variable "availability_zone_private_subnet2" {
  description = "Availability zone for the private subnet"
  type        = string
}



