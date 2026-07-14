#!/usr/bin/env bash
set -euo pipefail
ns="${1:-devops-prod}"
kubectl -n "$ns" delete pod -l app.kubernetes.io/name=devops-api --wait=false
kubectl -n "$ns" rollout status deployment --timeout=180s
