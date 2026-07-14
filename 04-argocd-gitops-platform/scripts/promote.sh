#!/usr/bin/env bash
set -Eeuo pipefail
[[ $# -eq 2 ]]||{ echo 'usage: promote.sh dev|staging|prod immutable-tag';exit 1;};E=$1;T=$2;case "$E" in dev|staging|prod);;*)exit 1;;esac
F="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/apps/devops-api/overlays/$E/kustomization.yaml"
python3 - "$F" "$T" <<'PYPROMOTE'
from pathlib import Path
import re,sys
p=Path(sys.argv[1]);p.write_text(re.sub(r'newTag: [^}
]+','newTag: '+sys.argv[2],p.read_text()))
PYPROMOTE
echo "Promotion diff ready for review"
