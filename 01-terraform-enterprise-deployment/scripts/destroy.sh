#!/usr/bin/env bash
set -euo pipefail
read -r -p "Type DESTROY to continue: " answer
[[ "$answer" == DESTROY ]] || exit 1
terraform destroy -auto-approve "$@"
