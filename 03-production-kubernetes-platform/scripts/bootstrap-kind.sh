#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for t in docker kind kubectl helm;do command -v "$t" >/dev/null||{ echo "$t required";exit 1;};done
kind get clusters|grep -qx devops-platform||kind create cluster --config "$ROOT/kind/cluster.yaml"
docker build -t devops-api:local "$ROOT/app";kind load docker-image devops-api:local --name devops-platform
helm upgrade --install devops-api "$ROOT/helm/devops-api" -n devops-platform --create-namespace --wait --timeout 5m
kubectl -n devops-platform rollout status deploy/devops-api-devops-api --timeout=180s
