# Security Policy

Report vulnerabilities privately through GitHub Security Advisories. Do not open a public issue for secrets or exploitable findings. The design keeps ECS tasks private, limits inbound task traffic to the ALB security group, enables ECR scanning, encrypts state and registry data, uses immutable image tags, and supports GitHub OIDC instead of long-lived AWS keys. Rotate any credential that is accidentally exposed and remove it from Git history.
