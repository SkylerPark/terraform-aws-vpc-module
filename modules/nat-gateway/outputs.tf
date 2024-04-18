output "id" {
  description = "NAT Gateway ID."
  value       = aws_nat_gateway.this.id
}

output "name" {
  description = "NAT Gateway 이름."
  value       = var.name
}

output "availability_zone" {
  description = <<EOF
  NAT Gateway 존영역.
    `id` - availability zone ID.
    `name` - availability zone Name.
  EOF
  value = {
    id   = data.aws_subnet.this.availability_zone_id
    name = data.aws_subnet.this.availability_zone
  }
}

output "vpc_id" {
  description = "NAT Gateway 할당되어 있는 VPC ID."
  value       = data.aws_subnet.this.vpc_id
}

output "subnet" {
  description = <<EOF
  NAT Gateway Subnet 정보.
    `id` - subnet ID.
    `arn` - subnet ARN.
  EOF
  value = {
    id  = aws_nat_gateway.this.subnet_id
    arn = data.aws_subnet.this.arn
  }
}

output "elastic_ip" {
  description = "elastic Ip 주소의 할당 ID."
  value       = aws_nat_gateway.this.allocation_id
}

output "primary_public_ip" {
  description = "NAT Gateway Public IP 주소."
  value       = aws_nat_gateway.this.public_ip
}

output "primary_private_ip" {
  description = "NAT Gateway Private IP 주소."
  value       = aws_nat_gateway.this.private_ip
}

output "secondary_private_ips" {
  description = "NAT Gateway Secondary Private IP 주소."
  value       = aws_nat_gateway.this.secondary_private_ip_addresses
}
