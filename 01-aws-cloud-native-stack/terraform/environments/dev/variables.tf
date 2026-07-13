variable "aws_region" { type=string; default="us-east-1" }
variable "project_name" { type=string; default="aws-cloud-native-stack" }
variable "environment" { type=string }
variable "vpc_cidr" { type=string; default="10.10.0.0/16" }
variable "public_subnet_cidrs" { type=list(string); default=["10.10.1.0/24","10.10.2.0/24"] }
variable "private_subnet_cidrs" { type=list(string); default=["10.10.11.0/24","10.10.12.0/24"] }
variable "container_port" { type=number; default=8080 }
variable "image_tag" { type=string; default="bootstrap" }
variable "cpu" { type=number; default=256 }
variable "memory" { type=number; default=512 }
variable "desired_count" { type=number }
variable "min_capacity" { type=number; default=1 }
variable "max_capacity" { type=number; default=4 }
variable "single_nat_gateway" { type=bool }
variable "log_retention_days" { type=number; default=14 }
