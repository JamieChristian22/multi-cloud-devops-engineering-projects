# Argo CD GitOps Platform

Declarative dev/staging/prod delivery with Kustomize overlays, an Argo CD AppProject and ApplicationSet, automated dev/staging reconciliation, controlled production promotion, policy checks, drift demonstration, and Git-revert rollback.

```bash
./scripts/bootstrap-gitops.sh
./scripts/verify-reconciliation.sh
```
Replace `REPOSITORY_URL` in `argocd/applicationset.yaml` with the final GitHub repository URL before applying the real ApplicationSet.
