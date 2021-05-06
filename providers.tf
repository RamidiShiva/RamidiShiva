terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  #in case of local key auth
  //shared_credentials_file = "~/.aws/credentials"
  //profile                 = ""
}