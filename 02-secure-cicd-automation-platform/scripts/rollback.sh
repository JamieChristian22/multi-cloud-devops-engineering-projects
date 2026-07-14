#!/usr/bin/env bash
set -euo pipefail
: "${ECS_CLUSTER:?}" "${ECS_SERVICE:?}" "${PREVIOUS_TASK_DEFINITION:?}"
aws ecs update-service --cluster "$ECS_CLUSTER" --service "$ECS_SERVICE" --task-definition "$PREVIOUS_TASK_DEFINITION" --force-new-deployment
aws ecs wait services-stable --cluster "$ECS_CLUSTER" --services "$ECS_SERVICE"
