variable "role_name" {
  description = "Name of the existing EC2 IAM role"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of the existing EC2 instance profile"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "owner" {
  description = "Owner of the IAM resources"
  type        = string
  default     = "Anil"
}