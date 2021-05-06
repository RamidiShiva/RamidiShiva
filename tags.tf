locals {
  common_tags = {
    Author  = var.author
    Project = var.project_name
    Env     = var.environment
  }
}