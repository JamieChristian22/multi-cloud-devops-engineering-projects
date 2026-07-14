variable "name" { type = string }
output "controls" { value = ["kms", "waf", "cloudtrail", "config", "guardduty", "security-hub"] }
