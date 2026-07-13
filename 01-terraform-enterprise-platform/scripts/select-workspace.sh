#!/usr/bin/env bash
set -euo pipefail
CLOUD="${1:?Usage: $0 <aws|azure|gcp> <dev|staging|prod>}"
ENVIRONMENT="${2:?Usage: $0 <aws|azure|gcp> <dev|staging|prod>}"
cd "terraform/$CLOUD"
terraform workspace select "$ENVIRONMENT" || terraform workspace new "$ENVIRONMENT"
terraform workspace show
