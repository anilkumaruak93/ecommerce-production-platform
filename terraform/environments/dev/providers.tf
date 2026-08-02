provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "ecommerce-production-platform"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "hyderabad"
  region = "ap-south-2"

  default_tags {
    tags = {
      Project     = "ecommerce-production-platform"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}