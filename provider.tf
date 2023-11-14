terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "landmark-automation-kenmak"
    key    = "elk/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-1"
}