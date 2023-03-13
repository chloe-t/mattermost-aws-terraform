# -------------------------------------------
# GLOBAL Variables
# -------------------------------------------
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = ""
}

variable "tags" {
  description = "List of tags"
  default     = null
}

variable "availability_zone" {
  description = "EC2 availability_zone"
  type        = string
  default     = null
}

# -------------------------------------------
# VPC Variables
# -------------------------------------------

variable "create_vpc" {
  description = "decision to create VPC"
  type        = bool
  default     = true
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.10.10.0/24"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

# -------------------------------------------
# Subnet Variables
# -------------------------------------------

variable "subnet_cidr" {
  description = "Subnet cidr block"
  type        = string
  default     = "10.10.10.0/25"
}

# -------------------------------------------
# Internet Gateway Variables
# -------------------------------------------

variable "create_igw" {
  description = "decision to create IGW"
  type        = bool
  default     = true
}

# -------------------------------------------
# Security Group Variables
# -------------------------------------------

variable "app_port" {
  description = "Port on which the app is exposed"
  type        = number
  default     = 8065
}

variable "allow_all_ips" {
  description = "IP ranges of allowed IP"
  type        = string
  default     = "0.0.0.0/0"

}
