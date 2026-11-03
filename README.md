# 🚀 Multi-Cloud DevOps Engineering Projects

<div align="center">

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws)
![Azure](https://img.shields.io/badge/Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure)
![Google Cloud](https://img.shields.io/badge/GCP-Cloud-4285F4?style=for-the-badge&logo=googlecloud)
![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF?style=for-the-badge&logo=githubactions)
![Linux](https://img.shields.io/badge/Linux-Administration-FCC624?style=for-the-badge&logo=linux)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?style=for-the-badge&logo=python)

[![GitHub Sponsors](https://img.shields.io/badge/GitHub-Sponsors-EA4AAA?style=for-the-badge&logo=githubsponsors&logoColor=white)](https://github.com/sponsors/JamieChristian22)

</div>

---

## Infrastructure validation that fails honestly

The [offline GitOps tests](./tests/test_gitops_contracts.py) verify that the ApplicationSet points at this repository and references existing development, staging and production overlay files. The [optional IaC checker](./scripts/check-optional-iac.sh) skips a tool **only when it is not installed**; if installed, Terraform formatting or Helm lint failures now fail validation instead of being mislabeled as skipped.

```bash
make validate
python -m unittest discover -s tests -p 'test_*.py' -v
```

The Kubernetes chart now uses the single [ServiceMonitor definition](./03-production-kubernetes-platform/helm/devops-api/templates/monitoring.yaml) controlled by the documented values. Helm rendering, actual cluster deployment and infrastructure provisioning remain separate from offline configuration checks.

---

## Quick review — four DevOps project tracks

[![Repository CI](https://github.com/JamieChristian22/multi-cloud-devops-engineering-projects/actions/workflows/portfolio-ci.yml/badge.svg)](https://github.com/JamieChristian22/multi-cloud-devops-engineering-projects/actions/workflows/portfolio-ci.yml)

| Project | Focus | Start here and inspect |
| --- | --- | --- |
| [01 · Terraform enterprise deployment](01-terraform-enterprise-deployment/README.md) | Modules, infrastructure planning, cost and rollback | [Architecture](01-terraform-enterprise-deployment/docs/ARCHITECTURE.md) · [Evidence log](01-terraform-enterprise-deployment/docs/EVIDENCE-LOG.md) |
| [02 · Secure CI/CD automation](02-secure-cicd-automation-platform/README.md) | Automated delivery, software supply chain, security headers | [Threat model](02-secure-cicd-automation-platform/docs/THREAT-MODEL.md) · [Tests](02-secure-cicd-automation-platform/tests/test_api.py) |
| [03 · Kubernetes platform](03-production-kubernetes-platform/README.md) | Containers, Helm, policy and operational recovery | [Evidence log](03-production-kubernetes-platform/docs/EVIDENCE-LOG.md) · [Test suite](03-production-kubernetes-platform/app/tests/test_api.py) |
| [04 · Argo CD GitOps](04-argocd-gitops-platform/README.md) | Reconciliation, progressive promotion and rollback | [Evidence log](04-argocd-gitops-platform/docs/EVIDENCE-LOG.md) · [Verification script](04-argocd-gitops-platform/scripts/verify-reconciliation.sh) |

**Reviewer route:** Start with the [five-minute guide](docs/RECRUITER-QUICKSTART.md), select one project, read its architecture, then compare its code, tests, deployment steps, and evidence log. For local syntax checks from the repository root:

```bash
make validate
```

The validator checks Python/JSON/shell syntax and can check YAML and other tools when installed. Its optional Terraform/Helm checks **may be skipped**, so an exit code of zero does not prove a successful production deployment.

A new [GitHub Actions validation workflow](.github/workflows/portfolio-ci.yml) runs source syntax checks and the existing test suites for Projects 01–03. No CI pass is claimed until the workflow actually reports success. Cloud deployment, Kubernetes cluster setup and Argo CD reconciliation require separate environments and are **not validated by that CI**.

**Evidence disclosure:** This is an enterprise-inspired **portfolio simulation and hands-on learning repository**. Architecture diagrams, demo configurations, and local checks are not evidence of deployed multi-cloud production systems. Inspect each project's evidence log for what was actually executed. Local bytecode artifacts were removed and ignored; operational inputs must use examples rather than real credentials.

[Portfolio website](https://jamiechristian22.github.io/) · [GitHub Sponsors](https://github.com/sponsors/JamieChristian22)

---

# 📖 Overview

Welcome to my **Multi-Cloud DevOps Engineering Projects** repository.

This repository contains enterprise-grade DevOps projects designed to simulate production environments across **Amazon Web Services (AWS)**, **Microsoft Azure**, and **Google Cloud Platform (GCP).**

Every project emphasizes:

- Infrastructure as Code
- CI/CD Automation
- Kubernetes
- Docker
- GitOps
- Cloud Security
- Observability
- Automation
- Deployment design and validation
- DevSecOps Best Practices

These projects are designed to demonstrate the technical skills expected from modern:

- DevOps Engineers
- Platform Engineers
- Cloud Engineers
- Site Reliability Engineers (SRE)
- Infrastructure Engineers

---

# 🎯 Repository Goals

✔ Enterprise Infrastructure

✔ Infrastructure as Code

✔ GitOps

✔ Continuous Integration

✔ Continuous Deployment

✔ Kubernetes

✔ Cloud Native Applications

✔ Security Automation

✔ Monitoring & Observability

✔ Production Readiness

---

# 📂 Repository Structure

```
multi-cloud-devops-engineering-projects/

│
├── 01-terraform-enterprise-deployment/
│
├── 02-secure-cicd-automation-platform/
│
├── 03-production-kubernetes-platform/
│
├── 04-argocd-gitops-platform/
│
├── LICENSE
├── README.md
├── CONTRIBUTING.md
├── SECURITY.md
├── CODE_OF_CONDUCT.md
└── CHANGELOG.md
```

---

# 🚀 Enterprise Projects

---

# 01 • Terraform Enterprise Deployment

### Objective

Model cloud infrastructure using Infrastructure as Code; deployment requires a separately configured, authorized environment.

### Technologies

- Terraform
- AWS
- Azure
- GCP
- Remote State
- Modules
- Workspaces
- IAM
- Networking

### Skills Demonstrated

- IaC
- Multi-cloud deployment
- Terraform modules
- Backend configuration
- State management
- Variables
- Outputs
- Reusable infrastructure

---

# 02 • CI/CD Automation Platform

### Objective

Build a production-grade Continuous Integration and Continuous Deployment platform.

### Technologies

- GitHub Actions
- Docker
- Terraform
- Kubernetes
- AWS
- Azure
- GCP

### Pipeline Features

- Automated Testing
- Build Validation
- Docker Image Creation
- Container Registry Push
- Infrastructure Validation
- Security Scanning
- Automated Deployment
- Rollback Support

---

# 03 • Container Platform

### Objective

Deploy highly available containerized workloads using Kubernetes.

### Technologies

- Kubernetes
- Docker
- Helm
- Ingress
- Services
- Deployments
- ConfigMaps
- Secrets

### Skills Demonstrated

- Kubernetes Administration
- High Availability
- Scaling
- Rolling Updates
- Health Checks
- Container Networking
- Storage
- Service Discovery

---

# 04 • GitOps Platform

### Objective

Implement GitOps workflows for fully automated infrastructure and application deployments.

### Technologies

- ArgoCD
- GitHub
- Kubernetes
- Helm
- Terraform

### Skills Demonstrated

- GitOps
- Continuous Delivery
- Automated Synchronization
- Drift Detection
- Self-Healing Deployments
- Declarative Infrastructure

---

# ☁️ Cloud Platforms

## Amazon Web Services

- IAM
- VPC
- EC2
- EKS
- ECS
- ECR
- S3
- Route53
- CloudWatch
- CloudTrail
- SNS
- Systems Manager

---

## Microsoft Azure

- Virtual Networks
- Virtual Machines
- Azure Kubernetes Service
- Azure Container Registry
- Azure Monitor
- Azure Key Vault
- Azure Storage

---

## Google Cloud Platform

- Compute Engine
- Google Kubernetes Engine
- Artifact Registry
- Cloud Build
- Cloud Storage
- IAM
- Cloud Monitoring

---

# 🛠 DevOps Toolchain

## Infrastructure

- Terraform

## Containers

- Docker

## Orchestration

- Kubernetes

## GitOps

- ArgoCD

## CI/CD

- GitHub Actions

## Version Control

- Git

## Scripting

- Bash

- Python

## Monitoring

- Prometheus

- Grafana

## Logging

- Loki

- Fluent Bit

## Security

- Trivy

- Checkov

- tfsec

- Docker Bench

---

# 📊 Skills Demonstrated

- Infrastructure as Code
- Cloud Engineering
- Platform Engineering
- DevSecOps
- Kubernetes Administration
- Containerization
- GitOps
- Continuous Integration
- Continuous Deployment
- Linux Administration
- Cloud Networking
- Identity & Access Management
- Automation
- Monitoring
- Logging
- Security Hardening
- Disaster Recovery
- High Availability

---

# 📸 Suggested Repository Screenshots

Include screenshots demonstrating:

- GitHub Repository Overview
- Terraform Apply
- GitHub Actions Pipeline
- Docker Build
- Container Registry
- Kubernetes Pods
- Kubernetes Services
- Deployments
- ArgoCD Dashboard
- Prometheus Dashboard
- Grafana Dashboard
- Cloud Console Resources
- Monitoring Alerts
- Infrastructure Diagram

---

# 📚 Learning Objectives

This repository demonstrates practical experience with:

- Enterprise DevOps
- Production Infrastructure
- Automation
- Kubernetes
- CI/CD
- GitOps
- Cloud Architecture
- Infrastructure Security
- DevSecOps
- Platform Engineering

---

# 🎯 Target Roles

This portfolio supports positions including:

- DevOps Engineer
- Cloud Engineer
- Platform Engineer
- Infrastructure Engineer
- Site Reliability Engineer (SRE)
- Cloud Automation Engineer
- Kubernetes Engineer
- DevSecOps Engineer

---

# 📜 Related Certification Learning Topics

These topics align with the following certification syllabi; this list does **not** claim the author holds these certifications:

- AWS Certified DevOps Engineer Professional
- AWS Solutions Architect
- AWS SysOps Administrator
- Azure DevOps Engineer Expert
- Azure Administrator Associate
- Google Professional Cloud DevOps Engineer
- Certified Kubernetes Administrator (CKA)
- Certified Kubernetes Application Developer (CKAD)
- HashiCorp Terraform Associate

---

# 🤝 Contributing

Contributions, feature requests, and improvements are welcome.

Please review:

- CONTRIBUTING.md
- CODE_OF_CONDUCT.md
- SECURITY.md

---

# 📄 License

Licensed under the MIT License.

See the LICENSE file for details.

---

# ⭐ Support

If you found this repository helpful:

⭐ Star the repository

🍴 Fork the repository

📢 Share it with others

---

## 💖 Support This Project

If these multi-cloud DevOps examples, architecture patterns, or learning resources are helpful, consider supporting continued development through [GitHub Sponsors](https://github.com/sponsors/JamieChristian22).

[![Become a GitHub Sponsor](https://img.shields.io/badge/Become%20a-GitHub%20Sponsor-EA4AAA?logo=githubsponsors&logoColor=white)](https://github.com/sponsors/JamieChristian22)

Sponsorship is optional and helps with development time, testing, documentation, and maintenance. You can also support the project by starring it, sharing useful examples, or contributing improvements. Sponsorship does not guarantee that feature suggestions will be implemented.

---

<div align="center">

## 🚀 Building Enterprise DevOps Solutions Across AWS • Azure • Google Cloud

**Infrastructure as Code • Kubernetes • GitOps • CI/CD • Automation • DevSecOps**

</div>

## License and third-party materials

See [LICENSE](LICENSE) for the repository license. Third-party code, datasets, images, and other assets retain their respective terms.

## Reviewer guide and asset provenance

Use [REVIEWER_GUIDE.md](REVIEWER_GUIDE.md) to navigate tracked evidence and review sample dataset/media source and reuse rights. Listings are not proof of ownership or license clearance.
