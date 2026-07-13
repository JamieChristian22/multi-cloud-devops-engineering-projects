#!/usr/bin/env bash
set -euo pipefail
ENVIRONMENT=${1:-dev}; REGION=${AWS_REGION:-us-east-1}; TAG=${2:-$(git rev-parse --short HEAD 2>/dev/null || date +%Y%m%d%H%M%S)}; ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text); REPOSITORY="aws-cloud-native-stack-${ENVIRONMENT}"; URI="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY}"; aws ecr get-login-password --region "$REGION" | docker login --username AWS --password-stdin "${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com"; docker build -t "${URI}:${TAG}" app; docker push "${URI}:${TAG}"; echo "${URI}:${TAG}"
