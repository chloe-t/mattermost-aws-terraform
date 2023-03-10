################################################################################
# VPC
################################################################################

resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge({ "Name" = "vpc-${var.project_name}" }, var.tags)
}

################################################################################
# Subnet
################################################################################

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this[0].id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = merge({ "Name" = "subnet-${var.project_name}" }, var.tags)

}

################################################################################
# Internet Gateway
################################################################################

resource "aws_internet_gateway" "this" {
  count = var.create_vpc && var.create_igw ? 1 : 0

  vpc_id = aws_vpc.this[0].id
  tags   = merge({ "Name" = "igw-${var.project_name}" }, var.tags)

}

################################################################################
# Security Group
################################################################################

resource "aws_security_group" "this" {
  name        = "sg-${var.project_name}"
  description = "Security group for ${aws_vpc.this[0].id}"
  vpc_id      = aws_vpc.this[0].id

  ingress {
    description = "SSH Port 22 allowed from ?? IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # TODO: change this?
  }

  ingress {
    description = "Ingress from VPC ${aws_vpc.this[0].id}"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = [var.subnet_cidr_block]
  }

  egress {
    description = "Egress from VPC ${aws_vpc.this[0].id}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                # allow all outbound
    cidr_blocks = [var.allow_all_ips] #["0.0.0.0/0"]
  }

  tags = merge({ "Name" = "sg-${var.project_name}" }, var.tags)
}

################################################################################
# Route tables
################################################################################

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.*.id
  }

  tags = merge({ "Name" = "routeTable-${var.project_name}" }, var.tags)
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
