variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "github_owner" {
  type    = string
  default = "mnaufalazwar"
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_username" {
  type    = string
  default = "mnaufalazwar"
}

variable "backend_repo_name" {
  type    = string
  default = "ccc-backend"
}

variable "frontend_repo_name" {
  type    = string
  default = "ccc-frontend"
}

variable "ecs_cluster_name" {
  type    = string
  default = "ccc-cluster"
}

variable "ecs_service_name" {
  type    = string
  default = "ccc-backend-service"
}

variable "ecr_repository_name" {
  type    = string
  default = "ccc-backend"
}

variable "s3_bucket_name" {
  type    = string
  default = "ccc-frontend-696637902012"
}

variable "cloudfront_distribution_id" {
  type    = string
  default = "EQGT9NDBE62H"
}

variable "backend_role_name" {
  type    = string
  default = "GitHubActionsBackendDeployRole"
}

variable "frontend_role_name" {
  type    = string
  default = "GitHubActionsFrontendDeployRole"
}