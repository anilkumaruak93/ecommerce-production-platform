variable "bucket_name" {
  description = "Name of the S3 bucket used for Velero backups"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}


variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}