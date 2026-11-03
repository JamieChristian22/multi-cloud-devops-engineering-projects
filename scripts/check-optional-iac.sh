#!/usr/bin/env bash
# Fail when an installed validation tool reports an error; skip only when absent.
set -Eeuo pipefail

if command -v terraform >/dev/null 2>&1; then
  terraform fmt -check -recursive
  echo "PASS: Terraform formatting"
else
  echo "SKIP: Terraform CLI unavailable (format not verified)"
fi

if command -v helm >/dev/null 2>&1; then
  helm lint 03-production-kubernetes-platform/helm/devops-api
  echo "PASS: Helm chart lint"
else
  echo "SKIP: Helm CLI unavailable (chart not verified)"
fi
