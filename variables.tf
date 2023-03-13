variable "aws_region" {
  description = "AWS infrastructure region"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "EC2 availability_zone"
  type        = string
  default     = "${aws_region}a"
}

variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}

variable "nb_ec2_instance" {
  description = "Number of required EC2 instances"
  type        = string
  default     = 1
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "mattermost"
}

variable "createdby" {
  description = "Creator"
  type        = string
  default     = "test"
}
