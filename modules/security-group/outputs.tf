output "id" {
  description = "security group ID."
  value       = aws_security_group.this.id
}

output "arn" {
  description = "security group ARN."
  value       = aws_security_group.this.arn
}

output "name" {
  description = "security group 이름."
  value       = aws_security_group.this.name
}

output "description" {
  description = "security group 설명."
  value       = aws_security_group.this.description
}

output "vpc_id" {
  description = "security group 이 포함되어 있는 VPC ID"
  value       = aws_security_group.this.vpc_id
}

output "ingress_rules" {
  description = "security group 수신 rules."
  value = {
    for name, rule in aws_vpc_security_group_ingress_rule.this :
    name => {
      id          = rule.id
      arn         = rule.arn
      description = rule.description

      protocol  = rule.ip_protocol
      from_port = rule.from_port
      to_port   = rule.to_port
    }
  }
}

output "egress_rules" {
  description = "security group 송신 rules."
  value = {
    for name, rule in aws_vpc_security_group_egress_rule.this :
    name => {
      id          = rule.id
      arn         = rule.arn
      description = rule.description

      protocol  = rule.ip_protocol
      from_port = rule.from_port
      to_port   = rule.to_port
    }
  }
}
