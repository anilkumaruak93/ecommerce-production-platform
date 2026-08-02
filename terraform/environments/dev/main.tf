module "ecr" {
  source = "../../modules/ecr"

  repository_names     = var.repository_names
  environment          = var.environment
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
}

module "s3_velero" {
  source = "../../modules/s3"

  bucket_name        = "ecommerce-velero-backup-324352301255-ap-south-1"
  environment        = var.environment
  versioning_enabled = true

  tags = {
    Name      = "ecommerce-velero-backup"
    Project   = "ecommerce-production-platform"
    ManagedBy = "Terraform"
    Owner     = "Anil"
    Purpose   = "Velero-Backup"
  }
}

module "prod_security_group" {
  source = "../../modules/security-group"

  providers = {
    aws = aws.hyderabad
  }

  name        = "launch-wizard-4"
  description = "launch-wizard-4 created 2026-07-28T06:23:36.153Z"
  vpc_id      = "vpc-04dc48480ef37bf59"
  environment = var.environment
  owner       = "Anil"
}

module "prod_ec2" {
  source = "../../modules/ec2"

  providers = {
    aws = aws.hyderabad
  }

  ami_id             = "ami-0199ac7c9fbf9ed83"
  instance_type      = "m7i-flex.xlarge"
  subnet_id          = "subnet-070755ea4aa51a7f6"
  security_group_ids = [module.prod_security_group.security_group_id]

  key_name   = "anil_pem"
  private_ip = "172.31.25.46"

  iam_instance_profile = "ecommerce-ec2-ecr-role"

  name        = "ecommerce-prod-server"
  environment = var.environment
  owner       = "Anil"
}

module "prod_network" {
  source = "../../modules/network-data"

  providers = {
    aws = aws.hyderabad
  }

  vpc_id    = "vpc-04dc48480ef37bf59"
  subnet_id = "subnet-070755ea4aa51a7f6"
}