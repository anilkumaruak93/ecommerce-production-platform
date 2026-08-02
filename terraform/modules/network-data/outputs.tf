output "vpc_id" {
  description = "Existing VPC ID"
  value       = data.aws_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = data.aws_vpc.this.cidr_block
}

output "subnet_id" {
  description = "Production subnet ID"
  value       = data.aws_subnet.this.id
}

output "subnet_cidr" {
  description = "Production subnet CIDR block"
  value       = data.aws_subnet.this.cidr_block
}

output "availability_zone" {
  description = "Production subnet availability zone"
  value       = data.aws_subnet.this.availability_zone
}

output "internet_gateway_id" {
  description = "Internet Gateway attached to the VPC"
  value       = data.aws_internet_gateway.this.id
}

output "route_table_id" {
  description = "Main route table ID"
  value       = data.aws_route_table.main.id
}
