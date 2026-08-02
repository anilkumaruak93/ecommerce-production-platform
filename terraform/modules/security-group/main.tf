resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name        = var.name
    Environment = var.environment
    Project     = "ecommerce-production-platform"
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

locals {
  node_ports = toset([
    "30081",
    "30356",
    "30743",
    "31967",
    "32318",
    "32588"
  ])
}

resource "aws_vpc_security_group_ingress_rule" "nodeport" {
  for_each = local.node_ports

  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = tonumber(each.value)
  to_port     = tonumber(each.value)
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}