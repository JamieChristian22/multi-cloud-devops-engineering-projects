# Secure CI/CD Automation Platform

A tested FastAPI service with a least-privilege GitHub Actions pipeline: lint, unit tests, SAST, dependency audit, secret scanning, container build, SBOM, Trivy scan, GHCR release, keyless signing, and OIDC-based ECS deployment.

```bash
make setup && make test && make security
make docker-build && make run
curl http://localhost:8080/readyz
```
Protect `main`, require CI, create staging/production environments, require production approval, and configure `AWS_ROLE_ARN` only for cloud deployment.
