provider "aws" {
  region = "us-west-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "landmark-automation-kenmak"
    key    = "my-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}
