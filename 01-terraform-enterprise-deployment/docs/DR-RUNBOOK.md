# Disaster Recovery Runbook

## Targets
- RTO: 60 minutes
- RPO: 15 minutes for configuration; stateless application data

## Recovery
1. Confirm incident scope and freeze deployments.
2. Restore the Terraform state version from the protected backend if required.
3. Select the recovery region tfvars file.
4. Run `terraform init -reconfigure`, `terraform plan`, and peer review the plan.
5. Apply infrastructure, push the signed image, and update DNS.
6. Run synthetic, health, security, and rollback tests.
7. Record timestamps and lessons learned.
