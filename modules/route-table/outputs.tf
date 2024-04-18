output "vpc_id" {
  description = "route table 할당되어 있는 VPC ID."
  value       = var.vpc_id
}

output "id" {
  description = "route table ID."
  value       = aws_route_table.this.id
}

output "arn" {
  description = "route table arn."
  value       = aws_route_table.this.arn
}

output "ipv4_routes" {
  description = "IPv4 CIDR 라우팅 테이블 rule 리스트."
  value = [
    for route in var.ipv4_routes : {
      destination = route.destination
      target = {
        id    = aws_route.ipv4[route.destination].id,
        state = aws_route.ipv4[route.destination].state,
        type  = route.target.type
        id = coalesce(
          aws_route.ipv4[route.destination].carrier_gateway_id,
          aws_route.ipv4[route.destination].core_network_arn,
          aws_route.ipv4[route.destination].egress_only_gateway_id,
          aws_route.ipv4[route.destination].gateway_id,
          aws_route.ipv4[route.destination].local_gateway_id,
          aws_route.ipv4[route.destination].nat_gateway_id,
          aws_route.ipv4[route.destination].network_interface_id,
          aws_route.ipv4[route.destination].transit_gateway_id,
          aws_route.ipv4[route.destination].vpc_endpoint_id,
          aws_route.ipv4[route.destination].vpc_peering_connection_id,
        )
      }
    }
  ]
}

output "ipv6_routes" {
  description = "IPv6 CIDR 라우팅 테이블 rule 리스트."
  value = [
    for route in var.ipv6_routes : {
      destination = route.destination
      target = {
        id    = aws_route.ipv6[route.destination].id,
        state = aws_route.ipv6[route.destination].state,
        type  = route.target.type
        id = coalesce(
          aws_route.ipv6[route.destination].carrier_gateway_id,
          aws_route.ipv6[route.destination].core_network_arn,
          aws_route.ipv6[route.destination].egress_only_gateway_id,
          aws_route.ipv6[route.destination].gateway_id,
          aws_route.ipv6[route.destination].local_gateway_id,
          aws_route.ipv6[route.destination].nat_gateway_id,
          aws_route.ipv6[route.destination].network_interface_id,
          aws_route.ipv6[route.destination].transit_gateway_id,
          aws_route.ipv6[route.destination].vpc_endpoint_id,
          aws_route.ipv6[route.destination].vpc_peering_connection_id,
        )
      }
    }
  ]
}

output "prefix_list_routes" {
  description = "Prefix list 라우팅 테이블 rule 리스트."
  value = [
    for route in var.prefix_list_routes : {
      destination = route.destination
      target = {
        id    = aws_route.prefix_list[route.destination].id,
        state = aws_route.prefix_list[route.destination].state,
        type  = route.target.type
        id = coalesce(
          aws_route.prefix_list[route.destination].carrier_gateway_id,
          aws_route.prefix_list[route.destination].core_network_arn,
          aws_route.prefix_list[route.destination].egress_only_gateway_id,
          aws_route.prefix_list[route.destination].gateway_id,
          aws_route.prefix_list[route.destination].local_gateway_id,
          aws_route.prefix_list[route.destination].nat_gateway_id,
          aws_route.prefix_list[route.destination].network_interface_id,
          aws_route.prefix_list[route.destination].transit_gateway_id,
          aws_route.prefix_list[route.destination].vpc_endpoint_id,
          aws_route.prefix_list[route.destination].vpc_peering_connection_id,
        )
      }
    }
  ]
}

output "associated_subnets" {
  description = "route table 과 연결된 서브넷 ID 목록."
  value       = values(aws_route_table_association.subnets)[*].subnet_id
}

output "propagated_vpn_gateways" {
  description = "경로를 전파하는 Virtual Private Gatway ID 목록."
  value       = values(aws_vpn_gateway_route_propagation.this)[*].vpn_gateway_id
}
