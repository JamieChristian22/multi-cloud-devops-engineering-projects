#!/usr/bin/env bash
set -euo pipefail
ENVIRONMENT=${1:-dev}; IMAGE_TAG=${2:-bootstrap}; cd "$(dirname "$0")/../terraform/environments/${ENVIRONMENT}"; terraform init; terraform apply -auto-approve -var="image_tag=${IMAGE_TAG}"
