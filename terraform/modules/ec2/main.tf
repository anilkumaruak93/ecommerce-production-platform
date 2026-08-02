resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  key_name   = var.key_name
  private_ip = var.private_ip

  iam_instance_profile = var.iam_instance_profile


  root_block_device {
    volume_type           = "gp3"
    volume_size           = 80
    iops                  = 3000
    throughput            = 125
    encrypted             = false
    delete_on_termination = true
  }


  tags = {
    Name        = var.name
    Environment = var.environment
    Project     = "ecommerce-production-platform"
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }

  lifecycle {
    prevent_destroy = true
  }
}

