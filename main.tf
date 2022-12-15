terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile    = "user_acc" #update with user acc

  default_tags { 
    tags = local.common_tags
  }
}

data "aws_vpc" "vpc" {
  tags = {
    Name : local.vpc_name
  }
}

data "aws_subnets" "compute_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
    tags = {
      tier = "comp"
  }
}

data "aws_default_tags" "current" {} #check
