output "name" {
  description = "subnet group 이름."
  value       = var.name
}

output "vpc_id" {
  description = "subnet group 이 할당되어 있는 VPC ID."
  value       = values(aws_subnet.this)[0].vpc_id
}

output "ids" {
  description = "subnet group id list"
  value       = values(aws_subnet.this)[*].id
}

output "arns" {
  description = "subnet group arn list"
  value       = values(aws_subnet.this)[*].arn
}

output "ipv4_cidrs" {
  description = "subnet IPv4 CIDR List."
  value       = compact(values(aws_subnet.this)[*].cidr_block)
}

output "ipv6_cidrs" {
  description = "subnet IPv4 CIDR List."
  value       = compact(values(aws_subnet.this)[*].ipv6_cidr_block)
}

output "subnets" {
  description = "Subnet Group 정보 리스트."
  value       = local.subnets
}

output "subnets_by_az" {
  description = "subnet group 에 대한 availability zone."
  value = {
    for subnet in local.subnets :
    subnet.availability_zone => subnet...
  }
}

output "dax_subnet_group" {
  description = <<EOF
  DAX Subnet Group 설정 정보.
    `id` - DAX Subnet Group ID.
    `name` - DAX Subnet Group Name.
  EOF
  value = (var.dax_subnet_group.enabled
    ? {
      id   = one(aws_dax_subnet_group.this[*].id)
      name = one(aws_dax_subnet_group.this[*].name)
    }
    : null
  )
}

output "dms_replication_subnet_group" {
  description = <<EOF
  DMS Replication Subnet Group 설정 정보.
    `id` - DMS Replication Subnet Group ID.
    `arn` - DMS Replication Subnet Group ARN.
    `name` - DMS Replication Subnet Group Name.
  EOF
  value = (var.dms_replication_subnet_group.enabled
    ? {
      id   = one(aws_dms_replication_subnet_group.this[*].id)
      arn  = one(aws_dms_replication_subnet_group.this[*].replication_subnet_group_arn)
      name = one(aws_dms_replication_subnet_group.this[*].replication_subnet_group_id)
    }
    : null
  )
}

output "docdb_subnet_group" {
  description = <<EOF
  DocumentDB Subnet Group 설정 정보.
    `id` - DocumentDB Subnet Group ID.
    `arn` - DocumentDB Subnet Group ARN.
    `name` - the DocumentDB Subnet Group Name.
  EOF
  value = (var.docdb_subnet_group.enabled
    ? {
      id   = one(aws_docdb_subnet_group.this[*].id)
      arn  = one(aws_docdb_subnet_group.this[*].arn)
      name = one(aws_docdb_subnet_group.this[*].name)
    }
    : null
  )
}

output "elasticache_subnet_group" {
  description = <<EOF
  ElastiCache Subnet Group 설정 정보.
    `id` - ElastiCache Subnet Group ID.
    `arn` - ElastiCache Subnet Group ARN.
    `name` - ElastiCache Subnet Group Name.
  EOF
  value = (var.elasticache_subnet_group.enabled
    ? {
      id   = one(aws_elasticache_subnet_group.this[*].id)
      arn  = one(aws_elasticache_subnet_group.this[*].arn)
      name = one(aws_elasticache_subnet_group.this[*].name)
    }
    : null
  )
}

output "memorydb_subnet_group" {
  description = <<EOF
  MemoryDB Subnet Group 설정 정보.
    `id` - MemoryDB Subnet Group ID.
    `arn` - MemoryDB Subnet Group ARN.
    `name` - the MemoryDB Subnet Group Name.
  EOF
  value = (var.memorydb_subnet_group.enabled
    ? {
      id   = one(aws_memorydb_subnet_group.this[*].id)
      arn  = one(aws_memorydb_subnet_group.this[*].arn)
      name = one(aws_memorydb_subnet_group.this[*].name)
    }
    : null
  )
}

output "neptune_subnet_group" {
  description = <<EOF
  Neptune Subnet Group 설정 정보.
    `id` - Neptune Subnet Group ID.
    `arn` - Neptune Subnet Group ARN.
    `name` - Neptune Subnet Group Name.
  EOF
  value = (var.neptune_subnet_group.enabled
    ? {
      id   = one(aws_neptune_subnet_group.this[*].id)
      arn  = one(aws_neptune_subnet_group.this[*].arn)
      name = one(aws_neptune_subnet_group.this[*].name)
    }
    : null
  )
}

output "rds_subnet_group" {
  description = <<EOF
  RDS Subnet Group 설정 정보.
    `id` - RDS Subnet Group ID.
    `arn` - RDS Subnet Group ARN.
    `name` - RDS Subnet Group Name.
  EOF
  value = (var.rds_subnet_group.enabled
    ? {
      id   = one(aws_db_subnet_group.this[*].id)
      arn  = one(aws_db_subnet_group.this[*].arn)
      name = one(aws_db_subnet_group.this[*].name)
    }
    : null
  )
}

output "redshift_subnet_group" {
  description = <<EOF
  Redshift Subnet Group 설정 정보.
    `id` - Redshift Subnet Group ID.
    `arn` - Redshift Subnet Group ARN.
    `name` - Redshift Subnet Group Name.
  EOF
  value = (var.redshift_subnet_group.enabled
    ? {
      id   = one(aws_redshift_subnet_group.this[*].id)
      arn  = one(aws_redshift_subnet_group.this[*].arn)
      name = one(aws_redshift_subnet_group.this[*].name)
    }
    : null
  )
}
