module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${var.project_name}-vpc"
  cidr   = var.cidr
  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2]
  ]
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = true
  enable_vpn_gateway = true
  #   tags = merge(local.common_tags)

  manage_default_security_group = true

  default_security_group_ingress = [
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = ""
    },
    # {
    #   from_port   = 0
    #   to_port     = 0
    #   protocol    = "-1"
    #   cidr_blocks = "0.0.0.0/0"
    #   description = "Allow All Traffic"
    # }
  ]

  default_security_group_egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow All Traffic"
    }
  ]

}