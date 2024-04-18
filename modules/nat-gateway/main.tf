data "aws_subnet" "this" {
  id = var.subnet_id
}

###################################################
# NAT Gateway
###################################################
resource "aws_nat_gateway" "this" {
  connectivity_type = var.is_private ? "private" : "public"
  subnet_id         = var.subnet_id

  ## Primary IP Addresse
  allocation_id = var.primary_ip_assignment.elastic_ip
  private_ip    = var.primary_ip_assignment.private_ip

  ## Secondary IP Addresses
  secondary_allocation_ids = (!var.is_private
    ? [
      for assignment in var.secondary_ip_assignments :
      assignment.elastic_ip
    ]
    : null
  )
  secondary_private_ip_addresses = (var.secondary_ip_count == null
    ? [
      for assignment in var.secondary_ip_assignments :
      assignment.private_ip
    ]
    : null
  )
  secondary_private_ip_address_count = var.secondary_ip_count

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )

  lifecycle {
    precondition {
      condition = anytrue([
        var.secondary_ip_count == null,
        var.secondary_ip_count != null && var.is_private == true,
      ])
      error_message = "`secondary_ip_count` variable is only supported with private NAT Gateway."
    }
  }
}
