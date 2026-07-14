variable "name" { type = string }
variable "retention_days" { type = number, default = 30 }
output "telemetry" { value = { logs = true, metrics = true, alarms = true, retention = var.retention_days } }
