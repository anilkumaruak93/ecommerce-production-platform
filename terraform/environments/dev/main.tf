module "ecr" {
  source = "../../modules/ecr"

  repository_names     = var.repository_names
  environment          = var.environment
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
}