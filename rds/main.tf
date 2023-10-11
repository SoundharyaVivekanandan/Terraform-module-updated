module "vpc" {
  source = "../vpc"  
  vpc_cidr = "10.0.0.0/16"   # VPC CIDR 
  private_subnet1_cidr = "10.0.1.0/24"   # Subnet CIDR 
  private_subnet2_cidr = "10.0.2.0/24" 
  availability_zone_private_subnet1 = "ap-south-1a"   # Availability Zone 
  availability_zone_private_subnet2 = "ap-south-1b"
}
resource "aws_db_subnet_group" "example" {
  name        = "example-subnet-group"  
  description = "Example DB subnet group"
  subnet_ids  = [
    module.vpc.private_subnet1_id,
    module.vpc.private_subnet2_id,
  ]
}

resource "aws_db_instance" "main" {
  allocated_storage    = var.db_allocated_storage
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  identifier           = "mydb"
  username             = "admin"
  password             = "password"
  db_subnet_group_name ="example-subnet-group"
 
  tags = {
    Name = "MyDBInstance"
  }
}