# 01 Terraform Enterprise Platform

Multi-cloud, multi-stage Infrastructure as Code platform for AWS, Azure, and Google Cloud.

## Capabilities
- Reusable Terraform modules
- Dev, staging, and prod isolation
- Remote state patterns
- Secure networks and compute
- Standardized tags and labels
- CI validation
- Validation and destroy runbooks

## Structure
architecture/, docs/, environments/, evidence/, modules/, policies/, runbooks/, scripts/, terraform/, variables/, .github/workflows/

## Deployment
1. Configure credentials and remote state.
2. Select a workspace.
3. Run `terraform init`, `plan`, and `apply`.
4. Validate resources.
5. Destroy non-production resources when finished.
