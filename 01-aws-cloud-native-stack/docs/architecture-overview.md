# Architecture Overview

Internet traffic enters an internet-facing Application Load Balancer in two public subnets. The ALB forwards requests to an IP target group containing ECS Fargate tasks in private subnets across two Availability Zones. Tasks pull immutable images from Amazon ECR and publish application logs to CloudWatch. NAT gateways provide controlled outbound access. ECS Service Auto Scaling targets CPU and memory utilization, while CloudWatch alarms publish to an SNS topic. Terraform creates every resource and supports isolated development and production state.

```mermaid
flowchart TB
  U[Internet users] --> ALB[Application Load Balancer]
  subgraph VPC[10.10.0.0/16 VPC]
    subgraph PUB[Public subnets in two AZs]
      ALB
      NAT[NAT Gateway or Gateways]
    end
    subgraph PRIV[Private application subnets]
      ECS1[ECS Fargate task]
      ECS2[ECS Fargate task]
    end
    ALB --> ECS1
    ALB --> ECS2
    ECS1 --> NAT
    ECS2 --> NAT
  end
  ECR[Amazon ECR] --> ECS1
  ECR --> ECS2
  ECS1 --> CW[CloudWatch Logs and Metrics]
  ECS2 --> CW
```
