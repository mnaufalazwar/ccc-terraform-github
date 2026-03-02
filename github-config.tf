resource "github_repository_environment" "backend_production" {
  repository  = var.backend_repo_name
  environment = "production"

  reviewers {
    users = [data.github_user.me.id]
  }
}

resource "github_repository_environment" "frontend_production" {
  repository  = var.frontend_repo_name
  environment = "production"

  reviewers {
    users = [data.github_user.me.id]
  }
}

resource "github_actions_secret" "backend_aws_role_arn" {
  repository      = var.backend_repo_name
  secret_name     = "AWS_ROLE_ARN"
  plaintext_value = data.aws_iam_role.backend_deploy.arn
}

resource "github_actions_secret" "frontend_aws_role_arn" {
  repository      = var.frontend_repo_name
  secret_name     = "AWS_ROLE_ARN"
  plaintext_value = data.aws_iam_role.frontend_deploy.arn
}

resource "github_actions_variable" "backend_aws_region" {
  repository    = var.backend_repo_name
  variable_name = "AWS_REGION"
  value         = var.aws_region
}

resource "github_actions_variable" "backend_ecr_repo" {
  repository    = var.backend_repo_name
  variable_name = "ECR_REPOSITORY"
  value         = data.aws_ecr_repository.backend.name
}

resource "github_actions_variable" "backend_ecs_cluster" {
  repository    = var.backend_repo_name
  variable_name = "ECS_CLUSTER"
  value         = var.ecs_cluster_name
}


resource "github_actions_variable" "backend_ecs_service" {
  repository    = var.backend_repo_name
  variable_name = "ECS_SERVICE"
  value         = var.ecs_service_name
}


resource "github_actions_variable" "backend_task_definition" {
  repository    = var.backend_repo_name
  variable_name = "ECS_TASK_DEFINITION"
  value         = "task-definition.json"
}

resource "github_actions_variable" "backend_container_name" {
  repository    = var.backend_repo_name
  variable_name = "ECS_CONTAINER_NAME"
  value         = "ccc-backend"
}

resource "github_actions_variable" "frontend_aws_region" {
  repository    = var.frontend_repo_name
  variable_name = "AWS_REGION"
  value         = var.aws_region
}

resource "github_actions_variable" "frontend_s3_bucket" {
  repository    = var.frontend_repo_name
  variable_name = "S3_BUCKET"
  value         = data.aws_s3_bucket.frontend.id
}

resource "github_actions_variable" "frontend_cloudfront_distribution" {
  repository    = var.frontend_repo_name
  variable_name = "CLOUDFRONT_DISTRIBUTION_ID"
  value         = data.aws_cloudfront_distribution.frontend.id
}