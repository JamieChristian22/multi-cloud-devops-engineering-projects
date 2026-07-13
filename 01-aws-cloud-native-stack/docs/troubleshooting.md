# Troubleshooting

## ECS tasks cannot pull the image
Confirm the image tag exists in the environment-specific ECR repository, the private route points to a working NAT gateway, and the execution role has `AmazonECSTaskExecutionRolePolicy`.

## Targets remain unhealthy
Check that `/health` returns HTTP 200 on port 8080, the task security group allows port 8080 from the ALB security group, task logs show Gunicorn started, and the target group uses target type `ip`.

## Terraform reports that the image does not exist
Use the staged bootstrap procedure in the deployment guide: create networking, security, ECR, and ALB first; push the `bootstrap` image; then apply the full configuration.

## Destroy fails because ECR contains images
Delete repository images first with the AWS CLI or console. This safeguard prevents accidental artifact deletion.

## GitHub OIDC access is denied
Verify the role trust policy matches the repository owner/name and GitHub environment, the workflow has `id-token: write`, and `AWS_DEPLOY_ROLE_ARN` is configured in the selected GitHub environment.
