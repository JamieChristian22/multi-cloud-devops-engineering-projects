# AWS Cloud-Native Stack — ECS Fargate and Terraform

[![CI](https://github.com/JamieChristian22/multi-cloud-devops-engineering-projects/actions/workflows/ci.yml/badge.svg)](https://github.com/JamieChristian22/multi-cloud-devops-engineering-projects/actions/workflows/ci.yml)
![AWS](https://img.shields.io/badge/AWS-ECS%20Fargate-FF9900?logo=amazonaws&logoColor=white) ![Terraform](https://img.shields.io/badge/Terraform-IaC-844FBA?logo=terraform&logoColor=white) ![Docker](https://img.shields.io/badge/Docker-Container-2496ED?logo=docker&logoColor=white)

A complete cloud-native web platform that deploys a containerized Flask application to Amazon ECS Fargate behind an Application Load Balancer. Terraform provisions the VPC, public and private subnets, routing, NAT, security groups, ECR, ECS, IAM, logging, alarms, and service auto scaling.

## What this project proves
- Production-style AWS networking across two Availability Zones.
- Reusable Terraform modules and isolated dev/prod environments.
- Private Fargate workloads exposed only through an ALB.
- Container build, health checks, immutable ECR images, and rolling ECS deployment.
- CloudWatch observability and target-tracking auto scaling.
- GitHub Actions CI/CD with AWS OIDC and security scanning.

## Repository map
```text
app/                         Flask application and Dockerfile
terraform/bootstrap/         Encrypted/versioned S3 state bucket
terraform/modules/           Networking, security, ECR, ALB, ECS, monitoring
terraform/environments/dev/  Cost-conscious development environment
terraform/environments/prod/ Highly available production environment
.github/workflows/            CI and OIDC deployment pipelines
scripts/                     Build, deploy, validate, and destroy helpers
docs/                        Architecture, deployment, security, cost, troubleshooting
evidence/                    Screenshot checklist
tests/                       Application tests
```

## Application endpoints
- `/` platform dashboard
- `/health` load-balancer and container health endpoint
- `/api/info` deployment metadata

## Start here
Read [`docs/deployment-guide.md`](docs/deployment-guide.md), then deploy the development environment. The bootstrap sequence is documented because ECS cannot start until the first ECR image exists.

## Architecture
See [`docs/architecture-overview.md`](docs/architecture-overview.md) for the Mermaid diagram and traffic flow. Fargate tasks use `awsvpc` networking and an ALB IP target group.

## Portfolio resume bullet
> Designed and deployed a highly available AWS cloud-native application platform using Terraform, Amazon ECS Fargate, ECR, and an Application Load Balancer across multiple Availability Zones, incorporating private networking, IAM roles, CloudWatch monitoring, container health checks, auto scaling, and GitHub Actions CI/CD.

## License
MIT
