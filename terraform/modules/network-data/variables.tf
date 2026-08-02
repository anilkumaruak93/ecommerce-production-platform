variable "vpc_id" {
  description = "Existing shared VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Existing subnet used by the production EC2 instance"
  type        = string
}
