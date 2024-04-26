locals {
  ipv4_secondary_cidrs = slice(var.ipv4_cidrs, 1, length(var.ipv4_cidrs))
  ipv6_enabled         = length(var.ipv6_cidrs) > 0
}

resource "aws_vpc" "this" {
  ## IPv4 CIDR Blocks
  cidr_block = (var.ipv4_cidrs[0].type == "MANUAL"
    ? var.ipv4_cidrs[0].cidr
    : null
  )
  ipv4_ipam_pool_id = (var.ipv4_cidrs[0].type == "IPAM_POOL"
    ? var.ipv4_cidrs[0].ipam_pool.id
    : null
  )
  ipv4_netmask_length = (var.ipv4_cidrs[0].type == "IPAM_POOL"
    ? var.ipv4_cidrs[0].ipam_pool.netmask_length
    : null
  )
  assign_generated_ipv6_cidr_block = (local.ipv6_enabled
    ? (var.ipv6_cidrs[0].type == "AMAZON"
      ? true
      : null
    )
    : null
  )
  ## IPv6 CIDR Blocks
  ipv6_cidr_block_network_border_group = (local.ipv6_enabled
    ? (var.ipv6_cidrs[0].type == "AMAZON"
      ? var.ipv6_cidrs[0].amazon.network_border_group
      : null
    )
    : null
  )
  ipv6_ipam_pool_id = (local.ipv6_enabled
    ? (var.ipv6_cidrs[0].type == "IPAM_POOL"
      ? var.ipv6_cidrs[0].ipam_pool.id
      : null
    )
    : null
  )
  ipv6_cidr_block = (local.ipv6_enabled
    ? (var.ipv6_cidrs[0].type == "IPAM_POOL"
      ? var.ipv6_cidrs[0].ipam_pool.cidr
      : null
    )
    : null
  )
  ipv6_netmask_length = (local.ipv6_enabled
    ? (var.ipv6_cidrs[0].type == "IPAM_POOL"
      ? var.ipv6_cidrs[0].ipam_pool.netmask_length
      : null
    )
    : null
  )

  ## Attributes
  instance_tenancy                     = var.tenancy
  enable_network_address_usage_metrics = var.network_address_usage_metrics_enabled

  enable_dns_hostnames = var.dns_hostnames_enabled
  enable_dns_support   = var.dns_resolution_enabled

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}

resource "aws_vpc_ipv4_cidr_block_association" "this" {
  count = length(var.ipv4_cidrs) > 0 ? length(var.ipv4_cidrs) - 1 : 0

  vpc_id = aws_vpc.this.id
  cidr_block = (var.ipv4_cidrs[count.index + 1].type == "MANUAL"
    ? var.ipv4_cidrs[count.index + 1].cidr
    : null
  )
  ipv4_ipam_pool_id = (var.ipv4_cidrs[count.index + 1].type == "IPAM_POOL"
    ? var.ipv4_cidrs[count.index + 1].ipam_pool.id
    : null
  )
  ipv4_netmask_length = (var.ipv4_cidrs[count.index + 1].type == "IPAM_POOL"
    ? var.ipv4_cidrs[count.index + 1].ipam_pool.netmask_length
    : null
  )
}

resource "aws_vpc_ipv6_cidr_block_association" "this" {
  count = length(var.ipv6_cidrs) > 0 ? length(var.ipv6_cidrs) - 1 : 0

  vpc_id = aws_vpc.this.id
  ipv6_cidr_block = (var.ipv6_cidrs[count.index + 1].type == "IPAM_POOL"
    ? var.ipv6_cidrs[count.index + 1].ipam_pool.cidr
    : null
  )
  ipv6_ipam_pool_id = (var.ipv6_cidrs[count.index + 1].type == "IPAM_POOL"
    ? var.ipv6_cidrs[count.index + 1].ipam_pool.id
    : null
  )
  ipv6_netmask_length = (var.ipv6_cidrs[count.index + 1].type == "IPAM_POOL"
    ? var.ipv6_cidrs[count.index + 1].ipam_pool.netmask_length
    : null
  )
}
