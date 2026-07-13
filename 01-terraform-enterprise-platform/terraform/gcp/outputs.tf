output "environment" { value=local.environment }
output "network_id" { value=module.network.network_id }
output "network_name" { value=module.network.network_name }
output "public_subnet_id" { value=module.network.public_subnet_id }
output "private_subnet_id" { value=module.network.private_subnet_id }
output "instance_name" { value=module.compute.instance_name }
output "public_ip" { value=module.compute.public_ip }
