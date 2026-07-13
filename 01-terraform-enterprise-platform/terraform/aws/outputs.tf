output "environment" { value=local.environment }
output "vpc_id" { value=module.network.vpc_id }
output "public_subnets" { value=module.network.public_subnet_ids }
output "private_subnets" { value=module.network.private_subnet_ids }
output "instance_id" { value=module.compute.instance_id }
output "public_ip" { value=module.compute.public_ip }
