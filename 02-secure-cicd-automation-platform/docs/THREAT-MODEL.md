# Threat Model

| Threat | Control |
|---|---|
| Leaked long-lived cloud keys | GitHub OIDC and short-lived roles |
| Vulnerable dependency | Dependabot, pip-audit, pinned lock file |
| Compromised image | SBOM, vulnerability scan, signed provenance |
| Secret committed to Git | Gitleaks and pre-commit detection |
| Unsafe production change | Protected environments and smoke-gated rollback |
| Mutable release | Commit-SHA and semantic-version tags |
