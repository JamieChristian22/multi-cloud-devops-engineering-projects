#!/usr/bin/env bash
set -Eeuo pipefail
kubectl -n devops-platform port-forward svc/devops-api-devops-api 18080:80 >/tmp/devops-api-pf.log 2>&1 & PID=$!;trap 'kill $PID 2>/dev/null||true' EXIT;sleep 3
curl -fsS http://127.0.0.1:18080/healthz|grep -q ok
curl -fsS http://127.0.0.1:18080/readyz|grep -q ready
curl -fsS -X POST -H 'Content-Type: application/json' -d '{"message":"smoke"}' http://127.0.0.1:18080/api/v1/echo|grep -q smoke
echo PASS
