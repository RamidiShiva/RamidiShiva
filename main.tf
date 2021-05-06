terraform {
  backend "remote" {
    organization = "ChainSafe"

    workspaces {
      name = "gossamer-devnet-us-east2"
    }
  }
}


###Get data from AWS
data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu-server-image" {
  most_recent = true
  owners      = ["099720109477"] ###Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}