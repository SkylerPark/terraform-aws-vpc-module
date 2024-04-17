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
  map_public_ip_on_launch = var.public_ipv4_address_assignment.enabled
  map_customer_owned_ip_on_launch = (var.customer_owned_ipv4_address_assignment.enabled
    ? true
    : null
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
  private_dns_hostname_type_on_launch         = var.dns_config.hostname_type
  enable_resource_name_dns_a_record_on_launch = var.dns_config.dns_resource_name_ipv4_enabled

  tags = merge({
    "Name" = each.key
    },
    var.tags
  )
}
