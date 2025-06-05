

# Define AWS Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  rendered_html = templatefile("${path.module}/../src/index.html.tpl")
}


provider "aws" {
  region = var.aws_region_name   # get to the variable file name
}

