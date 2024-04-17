data "aws_availability_zones" "available" {
  exclude_names = var.excloud_avaliability_zones
}

###################################################
# the Subnet Group
###################################################
resource "aws_subnet" "this" {
  for_each          = var.subnets
  vpc_id            = var.vpc_id
  availability_zone = each.value.availability_zone

  ## IP CIDR Blocks
  cidr_block = each.value.ipv4_cidr

  ## IP Assignments
  map_public_ip_on_launch = (each.value.type == "IPV6"
    ? false
    : var.public_ipv4_address_assignment.enabled
  )
  assign_ipv6_address_on_creation = (each.value.type == "IPV6"
    ? true
    : var.ipv6_address_assignment.enabled
  )
  map_customer_owned_ip_on_launch = (each.value.type == "IPV6"
    ? null
    : (var.customer_owned_ipv4_address_assignment.enabled
      ? true
      : null
    )
  )
  outpost_arn = (var.customer_owned_ipv4_address_assignment.enabled
    ? var.customer_owned_ipv4_address_assignment.outpost
    : null
  )
  customer_owned_ipv4_pool = (var.customer_owned_ipv4_address_assignment.enabled
    ? var.customer_owned_ipv4_address_assignment.pool
    : null
  )

  ## DNS Configurations
  private_dns_hostname_type_on_launch = (each.value.type == "IPV6"
    ? "resource-name"
    : local.hostname_types[var.dns_config.hostname_type]
  )
  enable_resource_name_dns_a_record_on_launch = var.dns_config.dns_resource_name_ipv4_enabled
  enable_resource_name_dns_aaaa_record_on_launch = (each.value.type == "IPV6"
    ? true
    : var.dns_config.dns_resource_name_ipv6_enabled
  )
}
