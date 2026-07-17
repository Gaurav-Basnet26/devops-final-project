variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-2"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR block for second public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}
# ==========================
# RDS Variables
# ==========================

variable "db_name" {
  description = "Database Name"
  type        = string
  default     = "employee_db"
}

variable "db_username" {
  description = "Database Username"
  type        = string
  default     = "employee"
}

variable "db_password" {
  description = "Database Password"
  type        = string
  default     = "employee123"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS Instance Class"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_allocated_storage" {
  description = "Allocated Storage"
  type        = number
  default     = 20
}
variable "alert_email" {

  description = "Email address for CloudWatch alerts"

  type = string

}

