#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)";O=$(kubectl -n devops-dev get deploy devops-api -o jsonpath='{.spec.replicas}')
kubectl -n devops-dev scale deploy devops-api --replicas=5;kubectl apply -k "$ROOT/apps/devops-api/overlays/dev";N=$(kubectl -n devops-dev get deploy devops-api -o jsonpath='{.spec.replicas}');test "$O" = "$N";echo "Drift restored to $N replicas"
