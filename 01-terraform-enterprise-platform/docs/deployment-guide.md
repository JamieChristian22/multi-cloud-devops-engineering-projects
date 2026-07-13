# Deployment Guide

## Prerequisites
Terraform 1.6+, AWS CLI, Azure CLI, Google Cloud CLI, Git, and Bash.

## Standard workflow
```bash
cd terraform/<cloud>
terraform init
terraform workspace select dev || terraform workspace new dev
terraform plan -out=dev.tfplan
terraform apply dev.tfplan
```
