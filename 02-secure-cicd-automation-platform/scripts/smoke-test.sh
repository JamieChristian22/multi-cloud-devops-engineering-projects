#!/usr/bin/env bash
set -euo pipefail
url="${1:?usage: smoke-test.sh URL}"
curl --fail --retry 10 --retry-delay 3 "$url/healthz"
curl --fail "$url/readyz"
