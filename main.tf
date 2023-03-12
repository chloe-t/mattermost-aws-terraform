terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "test-organization-tf-cloud" # To Update

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "test-organization-tf-cloud" # To update
    }
  }
}

variable "AWS_DEFAULT_REGION" {}

provider "aws" {
  region = var.AWS_DEFAULT_REGION
}

/* data "aws_region" "current" {}

  provider "aws" {
    region = data.aws_region.current.name
  } */

locals {
  tags = {
    Project     = var.project_name
    createdby   = var.createdby
    CreatedOn   = timestamp()
    Environment = terraform.workspace
  }
}

module "network" {
  source = "./modules/network"

  project_name      = var.project_name
  availability_zone = var.availability_zone
  tags              = merge({ "Module" = "${var.project_name}-network" }, local.tags)
}

module "ec2" {
  source     = "./modules/ec2"
  count      = var.nb_ec2_instance
  depends_on = [module.network]

  project_name          = var.project_name
  availability_zone     = var.availability_zone
  aws_security_group_id = module.network.aws_security_group_id
  tags                  = merge({ "Module" = "${var.project_name}-ec2" }, local.tags)
}



