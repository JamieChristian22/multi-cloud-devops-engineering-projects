#!/usr/bin/env bash
set -euo pipefail
env="${1:?dev|staging|prod}"
git revert --no-edit "${2:-HEAD}"
git push origin HEAD
printf 'Argo CD will reconcile %s to the reverted desired state.
' "$env"
