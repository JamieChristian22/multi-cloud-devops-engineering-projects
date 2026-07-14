#!/usr/bin/env bash
set -euo pipefail
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform plan -input=false -out=tfplan "$@"
terraform show -json tfplan > tfplan.json
