variable "aws_region"{type=string default="us-east-1"}
variable "project_name"{type=string default="devops-enterprise-api"}
variable "environment"{type=string default="dev" validation{condition=contains(["dev","staging","prod"],var.environment) error_message="Use dev, staging, or prod."}}
variable "vpc_cidr"{type=string default="10.42.0.0/16"}
variable "container_image"{type=string default="public.ecr.aws/docker/library/nginx:1.27-alpine"}
variable "container_port"{type=number default=8080}
variable "desired_count"{type=number default=2}
variable "alarm_email"{type=string default="" sensitive=true}
