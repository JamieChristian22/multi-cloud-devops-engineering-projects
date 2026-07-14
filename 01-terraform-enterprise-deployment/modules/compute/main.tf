variable "name" { type = string }
variable "desired_count" { type = number }
output "service" { value = { platform = "ecs-fargate", desired = var.desired_count, deployment_circuit_breaker = true } }
