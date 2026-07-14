package terraform.security

deny[msg] {
  r := input.resource_changes[_]
  r.type == "aws_security_group_rule"
  r.change.after.cidr_blocks[_] == "0.0.0.0/0"
  r.change.after.from_port != 443
  msg := sprintf("public ingress is restricted to HTTPS: %s", [r.address])
}
