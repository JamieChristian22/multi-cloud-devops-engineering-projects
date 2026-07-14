terraform{required_version=">=1.7.0" required_providers{aws={source="hashicorp/aws" version="~>5.0"} random={source="hashicorp/random" version="~>3.0"}}}
provider "aws"{region="us-east-1"}
resource "random_id" "suffix"{byte_length=4}
resource "aws_s3_bucket" "state"{bucket="devops-portfolio-tfstate-${random_id.suffix.hex}"}
resource "aws_s3_bucket_versioning" "state"{bucket=aws_s3_bucket.state.id versioning_configuration{status="Enabled"}}
resource "aws_s3_bucket_server_side_encryption_configuration" "state"{bucket=aws_s3_bucket.state.id rule{apply_server_side_encryption_by_default{sse_algorithm="AES256"}}}
resource "aws_s3_bucket_public_access_block" "state"{bucket=aws_s3_bucket.state.id block_public_acls=true block_public_policy=true ignore_public_acls=true restrict_public_buckets=true}
resource "aws_dynamodb_table" "locks"{name="devops-portfolio-terraform-locks" billing_mode="PAY_PER_REQUEST" hash_key="LockID" attribute{name="LockID" type="S"}}
output "backend"{value={bucket=aws_s3_bucket.state.bucket,dynamodb_table=aws_dynamodb_table.locks.name,region="us-east-1"}}
