#!/usr/bin/env bash
set -euo pipefail
terraform fmt -check -recursive
for cloud in aws azure gcp; do
  echo "Validating $cloud"
  (cd "terraform/$cloud" && terraform init -backend=false && terraform validate)
done
