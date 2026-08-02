terraform {
  backend "s3" {
    bucket       = "ecommerce-terraform-state-324352301255-ap-south-1"
    key          = "ecommerce-production-platform/dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
