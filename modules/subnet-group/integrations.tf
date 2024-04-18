###################################################
# Subnet Group for DAX
###################################################
resource "aws_dax_subnet_group" "this" {
  count = var.dax_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.dax_subnet_group.name, "${var.name}-dex-subnet-group")
  description = var.dax_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id
}

###################################################
# Subnet Group for DMS Replication
###################################################
resource "aws_dms_replication_subnet_group" "this" {
  count = var.dms_replication_subnet_group.enabled ? 1 : 0

  replication_subnet_group_id          = coalesce(var.dms_replication_subnet_group.name, "${var.name}-dmsreplication-subnet-group")
  replication_subnet_group_description = var.dms_replication_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.dms_replication_subnet_group.name, "${var.name}-dmsreplication-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for DocumentDB
###################################################
resource "aws_docdb_subnet_group" "this" {
  count = var.docdb_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.docdb_subnet_group.name, var.name)
  description = var.docdb_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.docdb_subnet_group.name, "${var.name}-docdb-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for ElastiCache
###################################################
resource "aws_elasticache_subnet_group" "this" {
  count = var.elasticache_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.elasticache_subnet_group.name, "${var.name}-elasticache-subnet-group")
  description = var.elasticache_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.elasticache_subnet_group.name, "${var.name}-elasticache-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for MemoryDB
###################################################
resource "aws_memorydb_subnet_group" "this" {
  count = var.memorydb_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.memorydb_subnet_group.name, "${var.name}-memorydb-subnet-group")
  description = var.memorydb_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.memorydb_subnet_group.name, "${var.name}-memorydb-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for Neptune
###################################################
resource "aws_neptune_subnet_group" "this" {
  count = var.neptune_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.neptune_subnet_group.name, "${var.name}-neptune-subnet-group")
  description = var.neptune_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.neptune_subnet_group.name, "${var.name}-neptune-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for RDS
###################################################
resource "aws_db_subnet_group" "this" {
  count = var.rds_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.rds_subnet_group.name, "${var.name}-rds-subnet-group")
  description = var.rds_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.rds_subnet_group.name, "${var.name}-rds-subnet-group")
    },
    var.tags,
  )
}

###################################################
# Subnet Group for Redshift
###################################################
resource "aws_redshift_subnet_group" "this" {
  count = var.redshift_subnet_group.enabled ? 1 : 0

  name        = coalesce(var.redshift_subnet_group.name, "${var.name}-redshift-subnet-group")
  description = var.redshift_subnet_group.description

  subnet_ids = values(aws_subnet.this)[*].id

  tags = merge(
    {
      "Name" = coalesce(var.redshift_subnet_group.name, "${var.name}-redshift-subnet-group")
    },
    var.tags,
  )
}
