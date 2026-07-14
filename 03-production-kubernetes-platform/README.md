# Production Kubernetes Platform

Production-style Helm deployment with probes, hardened security contexts, rolling updates, HPA, PDB, NetworkPolicy, ServiceMonitor, Prometheus alerts, Grafana dashboard, environment values, Kind bootstrap, and smoke tests.

```bash
./scripts/bootstrap-kind.sh
./scripts/smoke-test.sh
kind delete cluster --name devops-platform
```
