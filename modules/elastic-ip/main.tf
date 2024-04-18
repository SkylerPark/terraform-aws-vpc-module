###################################################
# Elastic IP
###################################################
resource "aws_eip" "this" {
  instance = var.instance.enabled ? var.instance.id : null

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}
