output "target_group_arn" {value=aws_lb_target_group.this.arn}
output "dns_name" {value=aws_lb.this.dns_name}
output "arn_suffix" {value=aws_lb.this.arn_suffix}
output "target_group_arn_suffix" {value=aws_lb_target_group.this.arn_suffix}
