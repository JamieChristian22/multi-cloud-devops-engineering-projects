# Deployment Guide

## Prerequisites
AWS CLI authenticated to the target account, Terraform 1.8 or newer, Docker, Git, and permission to create VPC, EC2 networking, ELB, ECS, ECR, IAM, CloudWatch, SNS, S3, and Application Auto Scaling resources.

## 1. Test locally
```bash
python3 -m pip install -r app/requirements.txt pytest
pytest -q
docker build -t aws-cloud-native-stack:local app
docker run --rm -p 8080:8080 aws-cloud-native-stack:local
```
Open `http://localhost:8080` and `http://localhost:8080/health`.

## 2. Create remote state
```bash
cd terraform/bootstrap
terraform init
terraform apply
terraform output -raw state_bucket_name
```
Copy `backend.tf.example` to `backend.tf` in each environment and replace the bucket value with the output. Backend configuration is intentionally account-specific and must remain outside source control when organizational policy requires it.

## 3. Create ECR and the first infrastructure revision
The initial task definition expects the tag `bootstrap`. First apply may create an ECS service before an image exists, so use this reliable sequence:
```bash
cd terraform/environments/dev
terraform init
terraform apply -target=module.networking -target=module.security -target=module.ecr -target=module.alb
cd ../../..
./scripts/build-and-push.sh dev bootstrap
./scripts/deploy.sh dev bootstrap
```

## 4. Verify
```bash
cd terraform/environments/dev
terraform output -raw application_url
curl "$(terraform output -raw application_url)/health"
aws ecs wait services-stable --cluster "$(terraform output -raw ecs_cluster_name)" --services "$(terraform output -raw ecs_service_name)"
```

## 5. GitHub deployment
Create GitHub environments named `dev` and `prod`. In each environment add the secret `AWS_DEPLOY_ROLE_ARN`, containing an IAM role configured to trust GitHub OIDC for this repository. Commit a real `backend.tf` or inject backend configuration through your organization’s preferred secure process. The deployment workflow builds, scans, pushes the commit-SHA image, applies Terraform, waits for ECS stability, and calls `/health`.

## 6. Cleanup
Delete non-empty ECR images before destroying, then run `./scripts/destroy.sh dev`. The state bucket has `force_destroy=false` to prevent accidental state loss and should be retained or emptied and removed separately.
