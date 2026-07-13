#!/usr/bin/env bash
set -euo pipefail
python3 -m pip install -q -r app/requirements.txt pytest; pytest -q; for env in dev prod; do (cd "terraform/environments/$env" && terraform init -backend=false >/dev/null && terraform validate); done; terraform fmt -check -recursive terraform; echo "Validation completed successfully."
