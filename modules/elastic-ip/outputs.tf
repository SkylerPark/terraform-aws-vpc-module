output "id" {
  description = "elastic ip ID"
  value       = aws_eip.this.id
}

output "public_ip" {
  description = "elastic ip Ip address"
  value       = aws_eip.this.public_ip
}
