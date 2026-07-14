# Architecture

```mermaid
flowchart TB
  U[Users] --> WAF[AWS WAF]
  WAF --> ALB[Application Load Balancer]
  ALB --> ECS[ECS Fargate Service]
  ECS --> SM[Secrets Manager]
  ECS --> CW[CloudWatch Logs and Metrics]
  ECR[ECR] --> ECS
  NAT[NAT Gateways] --> ECS
  CT[CloudTrail] --> LOGS[Encrypted Audit S3]
  CFG[AWS Config] --> LOGS
  GD[GuardDuty] --> SH[Security Hub]
  CW --> SNS[SNS Alerts]
```

The reference stack uses two availability zones, isolated workload subnets, encrypted storage, least-privilege roles, centralized audit logs, alarms, autoscaling, and remote Terraform state locking.
