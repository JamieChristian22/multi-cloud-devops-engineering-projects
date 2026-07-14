#!/usr/bin/env bash
set -euo pipefail
image="${1:?image required}"
syft "$image" -o cyclonedx-json=sbom.cdx.json
