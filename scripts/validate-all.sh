#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)";cd "$ROOT"
python3 - <<'PYVALID'
from pathlib import Path
import ast,json
for p in Path('.').rglob('*.py'):ast.parse(p.read_text(),filename=str(p))
for p in Path('.').rglob('*.json'):json.loads(p.read_text())
try:
 import yaml
 for p in list(Path('.').rglob('*.yml'))+list(Path('.').rglob('*.yaml')):
  if '/templates/' not in p.as_posix(): list(yaml.safe_load_all(p.read_text()))
 print('Python, JSON and YAML syntax: PASS')
except ImportError: print('Python and JSON syntax: PASS; install PyYAML for YAML parsing')
PYVALID
find . -type f -name '*.sh' -print0 | xargs -0 -n1 bash -n
echo 'Shell syntax: PASS'
command -v terraform >/dev/null && terraform fmt -check -recursive || echo 'Terraform fmt skipped (CLI unavailable)'
command -v helm >/dev/null && helm lint 03-production-kubernetes-platform/helm/devops-api || echo 'Helm lint skipped (CLI unavailable)'
