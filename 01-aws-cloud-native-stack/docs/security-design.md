# Security Design

- ECS tasks have no public IP addresses and run only in private subnets.
- The task security group accepts the application port only from the ALB security group.
- The container runs as a non-root Linux user.
- The ECR repository uses immutable tags, encryption, lifecycle cleanup, and scan-on-push.
- Terraform state is encrypted, versioned, public-access-blocked, and protected with S3 native lock files.
- GitHub Actions uses short-lived OIDC credentials rather than stored access keys.
- Deployment rollback is enabled through the ECS deployment circuit breaker.
- CloudWatch logs have finite retention, and alarms cover CPU, memory, unhealthy targets, and ALB 5XX responses.
- HTTP is provided for a self-contained lab. Production deployment should add ACM, an HTTPS listener, HTTP-to-HTTPS redirect, AWS WAF, VPC endpoints, and organization-specific egress restrictions.
