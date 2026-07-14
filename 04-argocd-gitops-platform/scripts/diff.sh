#!/usr/bin/env bash
set -euo pipefail
env="${1:?environment required}"
kustomize build "apps/devops-api/overlays/$env" | kubectl diff -f - || status=$?
[[ "${status:-0}" -eq 0 || "${status:-0}" -eq 1 ]]
