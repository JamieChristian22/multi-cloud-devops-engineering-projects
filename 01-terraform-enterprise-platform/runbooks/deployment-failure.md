# Deployment Failure Runbook

1. Capture the error.
2. Confirm account, subscription, or project context.
3. Check authentication, quotas, and provider registration.
4. Review naming conflicts and dependencies.
5. Run `terraform plan` again.
6. Import existing resources only when intentional.
7. Document the root cause.
