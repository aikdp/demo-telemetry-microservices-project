terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" { #need to create manually or use tf in AWS, then use here
    bucket         = "demo-otel-app-project" #"vpc-module-rs"
    key            = "EKS-VPC-MiX-SI-AB-may-abvm.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "vpc-module-locking"
    use_lockfile = true
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}  