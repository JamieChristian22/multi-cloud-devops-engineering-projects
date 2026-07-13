output "application_url" {value="http://${module.alb.dns_name}"}
output "ecr_repository_url" {value=module.ecr.repository_url}
output "ecs_cluster_name" {value=module.ecs.cluster_name}
output "ecs_service_name" {value=module.ecs.service_name}
output "cloudwatch_log_group" {value=module.ecs.log_group_name}
output "alerts_topic_arn" {value=module.monitoring.sns_topic_arn}
