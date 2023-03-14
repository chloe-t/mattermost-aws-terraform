
output "aws_security_group_id" {
  value       = try(aws_security_group.this.id, "")
  description = "security group id"
}

output "aws_security_group_arn" {
  value       = try(aws_security_group.this.arn, "")
  description = "security group arn"
}

output "aws_vpc_id" {
  value       = try(aws_vpc.this[0].id, "")
  description = "VPC id"
}

output "aws_subnet_id" {
  value       = try(aws_subnet.this.id, "")
  description = "Subnet ID"
}
