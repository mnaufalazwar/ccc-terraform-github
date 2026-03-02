data "github_user" "me" {
  username = var.github_username
}

data "aws_ecr_repository" "backend" {
  name = var.ecr_repository_name
}

data "aws_ecs_cluster" "backend" {
  cluster_name = var.ecs_cluster_name
}

data "aws_ecs_service" "backend" {
  cluster_arn  = data.aws_ecs_cluster.backend.arn
  service_name = var.ecs_service_name
}

data "aws_s3_bucket" "frontend" {
  bucket = var.s3_bucket_name
}

data "aws_cloudfront_distribution" "frontend" {
  id = var.cloudfront_distribution_id
}

data "aws_iam_role" "backend_deploy" {
  name = var.backend_role_name
}

data "aws_iam_role" "frontend_deploy" {
  name = var.frontend_role_name
}