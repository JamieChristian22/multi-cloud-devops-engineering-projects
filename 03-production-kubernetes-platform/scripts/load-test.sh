#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${1:?URL required}" k6 run k6/load.js
