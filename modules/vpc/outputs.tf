output "name" {
  description = "VPC 이름."
  value       = var.name
}

output "id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "arn" {
  description = "VPC arn"
  value       = aws_vpc.this.arn
}

output "ipv4_primary_cidr" {
  description = "VPC Primary CIDR blocks."
  value       = aws_vpc.this.cidr_block
}

output "ipv4_secondary_cidr" {
  description = "VPC Secondary CIDR blocks."
  value = [
    for association in aws_vpc_ipv4_cidr_block_association.this :
    association.cidr_block
  ]
}

output "ipv6_primary_cidr" {
  description = "VPC Primary CIDR blocks."
  value       = local.ipv6_enabled ? aws_vpc.this.ipv6_cidr_block : null
}

output "ipv6_secondary_cidr" {
  description = "VPC Primary CIDR blocks."
  value = local.ipv6_enabled ? [
    for association in aws_vpc_ipv6_cidr_block_association.this :
    association.ipv6_cidr_block
  ] : []
}

output "internet_gateway" {
  description = <<EOF
  VPC Internet Gateway 내용.
    `id` - Internet Gateway ID.
    `arn` - Internet Gateway ARN.
  EOF
  value = (var.internet_gateway.enabled
    ? {
      id  = one(aws_internet_gateway.this[*].id)
      arn = one(aws_internet_gateway.this[*].arn)
    }
    : null
  )
}

output "vpn_gateway" {
  description = <<EOF
  VPC virtual private gateway of 내용.
    `id` - Virtual Private Gateway ID.
    `arn` - Virtual Private Gateway ARN.
    `asn` - Virtual Private Gateway Autonomous System Number (ASN).
  EOF
  value = (var.vpn_gateway.enabled
    ? {
      id  = one(aws_vpn_gateway.this[*].id)
      arn = one(aws_vpn_gateway.this[*].arn)
      asn = one(aws_vpn_gateway.this[*].amazon_side_asn)
    }
    : null
  )
}
