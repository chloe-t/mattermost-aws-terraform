# -------------------------------------------
# GLOBAL Variables
# -------------------------------------------

# Inherits from root variables
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = null
}

# Inherits from root variables
variable "availability_zone" {
  description = "EC2 availability_zone"
  type        = string
  default     = null
}

# Inherits from root variables
variable "aws_security_group_id" {
  description = "Security Group ID issued from network module"
  type        = string
  default     = null
}

# Inherits from root variables
variable "tags" {
  description = "List of tags"
  default     = null
}

# -------------------------------------------
# EC2
# -------------------------------------------
variable "ami" {
  description = "ami ID of ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230207"
  type        = string
  default     = "ami-0cc4e06e6e710cd94"
}

variable "instance_type" {
  description = "EC2 instance_type to use"
  type        = string
  default     = "t2.micro"
}

variable "aws_subnet_id" {
  description = "ID of the subnet created during deployment"
  type        = string
  default     = null
}

variable "key_name" {
  description = "key_name to use to connect to the instance"
  type        = string
  default     = "mttmst_kp"
}

variable "install_script_name" {
  description = "Name of the script file containing install line"
  type        = string
  default     = "user-data-mattermost.sh"
}
