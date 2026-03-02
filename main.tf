terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  
  backend "s3" {
    bucket         = "ccc-tfstate-696637902012-ap-southeast-1"
    key            = "ccc/github/prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "ccc-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}