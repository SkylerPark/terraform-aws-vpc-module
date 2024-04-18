###################################################
# Route Table
###################################################
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}

###################################################
# Associations
###################################################
resource "aws_route_table_association" "subnets" {
  for_each = { for idx, subnet_id in var.subnets : idx => subnet_id }

  route_table_id = aws_route_table.this.id
  subnet_id      = each.value
}

###################################################
# Route Propagations
###################################################
resource "aws_vpn_gateway_route_propagation" "this" {
  for_each = { for idx, gateway_id in var.propagating_vpn_gateways : idx => gateway_id }

  route_table_id = aws_route_table.this.id
  vpn_gateway_id = each.value
}

###################################################
# IPv4 Routes
###################################################
resource "aws_route" "ipv4" {
  for_each = {
    for route in var.ipv4_routes :
    route.destination => route
  }

  route_table_id         = aws_route_table.this.id
  destination_cidr_block = each.key

  ## Targets
  carrier_gateway_id = (each.value.target.type == "CARRIER_GATEWAY"
    ? each.value.target.id
    : null
  )
  core_network_arn = (each.value.target.type == "CORE_NETWORK"
    ? each.value.target.id
    : null
  )
  egress_only_gateway_id = (each.value.target.type == "EGRESS_ONLY_INTERNET_GATEWAY"
    ? each.value.target.id
    : null
  )
  gateway_id = (contains(["INTERNET_GATEWAY", "VPN_GATEWAY"], each.value.target.type)
    ? each.value.target.id
    : null
  )
  local_gateway_id = (each.value.target.type == "LOCAL_GATEWAY"
    ? each.value.target.id
    : null
  )
  nat_gateway_id = (each.value.target.type == "NAT_GATEWAY"
    ? each.value.target.id
    : null
  )
  network_interface_id = (each.value.target.type == "NETWORK_INTERFACE"
    ? each.value.target.id
    : null
  )
  transit_gateway_id = (each.value.target.type == "TRANSIT_GATEWAY"
    ? each.value.target.id
    : null
  )
  vpc_endpoint_id = (each.value.target.type == "VPC_ENDPOINT"
    ? each.value.target.id
    : null
  )
  vpc_peering_connection_id = (each.value.target.type == "VPC_PEERING_CONNECTION"
    ? each.value.target.id
    : null
  )
}

###################################################
# IPv6 Routes
###################################################
resource "aws_route" "ipv6" {
  for_each = {
    for route in var.ipv6_routes :
    route.destination => route
  }

  route_table_id              = aws_route_table.this.id
  destination_ipv6_cidr_block = each.key


  ## Targets
  carrier_gateway_id = (each.value.target.type == "CARRIER_GATEWAY"
    ? each.value.target.id
    : null
  )
  core_network_arn = (each.value.target.type == "CORE_NETWORK"
    ? each.value.target.id
    : null
  )
  egress_only_gateway_id = (each.value.target.type == "EGRESS_ONLY_INTERNET_GATEWAY"
    ? each.value.target.id
    : null
  )
  gateway_id = (contains(["INTERNET_GATEWAY", "VPN_GATEWAY"], each.value.target.type)
    ? each.value.target.id
    : null
  )
  local_gateway_id = (each.value.target.type == "LOCAL_GATEWAY"
    ? each.value.target.id
    : null
  )
  nat_gateway_id = (each.value.target.type == "NAT_GATEWAY"
    ? each.value.target.id
    : null
  )
  network_interface_id = (each.value.target.type == "NETWORK_INTERFACE"
    ? each.value.target.id
    : null
  )
  transit_gateway_id = (each.value.target.type == "TRANSIT_GATEWAY"
    ? each.value.target.id
    : null
  )
  vpc_endpoint_id = (each.value.target.type == "VPC_ENDPOINT"
    ? each.value.target.id
    : null
  )
  vpc_peering_connection_id = (each.value.target.type == "VPC_PEERING_CONNECTION"
    ? each.value.target.id
    : null
  )
}

###################################################
# Prefix List Routes
###################################################
resource "aws_route" "prefix_list" {
  for_each = {
    for route in var.prefix_list_routes :
    route.name => route
  }

  route_table_id             = aws_route_table.this.id
  destination_prefix_list_id = each.value.destination


  ## Targets
  carrier_gateway_id = (each.value.target.type == "CARRIER_GATEWAY"
    ? each.value.target.id
    : null
  )
  core_network_arn = (each.value.target.type == "CORE_NETWORK"
    ? each.value.target.id
    : null
  )
  egress_only_gateway_id = (each.value.target.type == "EGRESS_ONLY_INTERNET_GATEWAY"
    ? each.value.target.id
    : null
  )
  gateway_id = (contains(["INTERNET_GATEWAY", "VPN_GATEWAY"], each.value.target.type)
    ? each.value.target.id
    : null
  )
  local_gateway_id = (each.value.target.type == "LOCAL_GATEWAY"
    ? each.value.target.id
    : null
  )
  nat_gateway_id = (each.value.target.type == "NAT_GATEWAY"
    ? each.value.target.id
    : null
  )
  network_interface_id = (each.value.target.type == "NETWORK_INTERFACE"
    ? each.value.target.id
    : null
  )
  transit_gateway_id = (each.value.target.type == "TRANSIT_GATEWAY"
    ? each.value.target.id
    : null
  )
  vpc_endpoint_id = (each.value.target.type == "VPC_ENDPOINT"
    ? each.value.target.id
    : null
  )
  vpc_peering_connection_id = (each.value.target.type == "VPC_PEERING_CONNECTION"
    ? each.value.target.id
    : null
  )
}
