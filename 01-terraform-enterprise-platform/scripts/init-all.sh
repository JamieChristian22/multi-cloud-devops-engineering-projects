#!/usr/bin/env bash
set -euo pipefail
for cloud in aws azure gcp; do
  echo "Initializing $cloud"
  (cd "terraform/$cloud" && terraform init -backend=false)
done
