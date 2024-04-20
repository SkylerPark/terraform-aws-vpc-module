output "vpc" {
  description = "VPC 정보"
  value       = module.vpc
}

output "public_subnets" {
  description = "Public Subnet 정보"
  value       = module.public_subnet_group
}

output "private_subnets" {
  description = "Private Subnet 정보"
  value       = module.private_subnet_group
}

output "database_subnets" {
  description = "Database Subnet 정보"
  value       = module.database_subnet_group
}

output "public_route" {
  description = "Public 라우팅 정보"
  value       = module.public_route_table
}

output "private_route" {
  description = "Private 라우팅 정보"
  value       = module.private_route_table
}

output "database_route" {
  description = "Database 라우팅 정보"
  value       = module.database_route_table
}

output "nat_gateway" {
  description = "NatGateway 정보"
  value       = module.nat_gateway
}
