variable "aws_region" {
  description = "AWS region where development resources will be created"
  type        = string
  default     = "ap-south-2"
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"
}

variable "repository_names" {
  description = "List of ECR repositories for ecommerce microservices"
  type        = list(string)
}

