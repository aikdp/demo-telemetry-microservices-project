provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "main"{
    bucket = "demo-otel-app-project"

    lifecycle{
        prevent_destroy = false
    }
}

resource "aws_dynamodb_table" "main" {
  name           = "otel-project-terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST" #default is PROVISIONED
  hash_key       = "LockId" #attribute name should match the hash_key

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table"
    Environment = "dev"
  }
}