# Operations runbooks

## High latency
Check request rate, p95, CPU throttling, memory, recent releases, and downstream errors. Roll back when correlated with a release.

## CrashLoopBackOff
Inspect describe output, previous logs, events, probes, image, configuration, permissions, and limits. Use `helm rollback` for a known-good revision.

## Saturation
Inspect HPA, pending pods, node capacity, and scheduling events before adding capacity.
