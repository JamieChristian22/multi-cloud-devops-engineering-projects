#!/usr/bin/env bash
set -euo pipefail
ENVIRONMENT=${1:-dev}; cd "$(dirname "$0")/../terraform/environments/${ENVIRONMENT}"; terraform init; terraform destroy -auto-approve
