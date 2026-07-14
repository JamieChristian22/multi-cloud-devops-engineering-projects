#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for t in docker kind kubectl;do command -v "$t" >/dev/null||{ echo "$t required";exit 1;};done
kind get clusters|grep -qx gitops-platform||kind create cluster --name gitops-platform
docker build -t devops-api:local "$ROOT/app";kind load docker-image devops-api:local --name gitops-platform
kubectl create ns argocd --dry-run=client -o yaml|kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd rollout status deploy/argocd-server --timeout=300s
for e in dev staging prod;do kubectl apply -k "$ROOT/apps/devops-api/overlays/$e";done
kubectl -n devops-dev rollout status deploy/devops-api --timeout=180s
