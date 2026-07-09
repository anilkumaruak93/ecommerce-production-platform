variable "repository_names" {
  description = "List of ECR repository names to create"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}

variable "image_tag_mutability" {
  description = "Controls whether image tags can be overwritten"
  type        = string
  default     = "IMMUTABLE"

  validation {
    condition = contains(
      ["MUTABLE", "IMMUTABLE"],
      var.image_tag_mutability
    )

    error_message = "image_tag_mutability must be MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Enable vulnerability scanning when an image is pushed"
  type        = bool
  default     = true
}