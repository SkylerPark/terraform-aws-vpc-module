###################################################
# Internet Gateway
###################################################
resource "aws_internet_gateway" "this" {
  count  = var.internet_gateway.enabled ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = coalesce(var.internet_gateway.name, local.metadata.name)
    },
    local.module_tags,
    var.tags,
  )
}

###################################################
# Virtual Private Gateway
###################################################
resource "aws_vpn_gateway" "this" {
  count  = var.vpn_gateway.enabled ? 1 : 0
  vpc_id = aws_vpc.this.id

  amazon_side_asn = var.vpn_gateway.asn

  tags = merge(
    {
      "Name" = coalesce(var.vpn_gateway.name, local.metadata.name)
    },
    local.module_tags,
    var.tags,
  )
}
