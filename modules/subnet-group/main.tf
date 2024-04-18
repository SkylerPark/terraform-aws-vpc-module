locals {
  subnets = [
    for name, subnet in aws_subnet.this : {
      id   = subnet.id
      arn  = subnet.arn
      name = name

      availability_zone    = subnet.availability_zone
      availability_zone_id = subnet.availability_zone_id

      ipv4_cidr = subnet.cidr_block
      ipv6_cidr = subnet.ipv6_cidr_block
    }
  ]
}

###################################################
# the Subnet Group
###################################################
resource "aws_subnet" "this" {
  for_each          = var.subnets
  vpc_id            = var.vpc_id
  availability_zone = each.value.availability_zone

  ## IP CIDR Blocks
  ipv6_native = each.value.type == "IPV6"

  cidr_block      = each.value.ipv4_cidr
  ipv6_cidr_block = each.value.ipv6_cidr

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
    : var.dns_config.hostname_type
  )
  enable_resource_name_dns_a_record_on_launch = (each.value.type == "IPV6"
    ? false
    : var.dns_config.dns_resource_name_ipv4_enabled
  )
  enable_resource_name_dns_aaaa_record_on_launch = (each.value.type == "IPV6"
    ? true
    : var.dns_config.dns_resource_name_ipv6_enabled
  )
  enable_dns64 = var.dns_config.dns64_enabled

  tags = merge({
    "Name" = each.key
    },
    var.tags
  )
}
