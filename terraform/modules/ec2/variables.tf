variable "ami_id" {
  description = "AMI ID of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "private_ip" {
  description = "Private IP address of the EC2 instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile attached to EC2"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "Anil"
}

variable "name" {
  description = "EC2 Name tag"
  type        = string
}