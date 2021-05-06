module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = var.project_name
  use_num_suffix         = true
  instance_count         = var.instance_count
  ami                    = data.aws_ami.ubuntu-server-image.id
  instance_type          = var.instance_type
  key_name               = var.master_ssh_key
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = merge(
    local.common_tags
  )

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 100
    },
  ]


  depends_on = [module.vpc]
}


resource "null_resource" "provision_ec2" {
  provisioner "local-exec" {
    command = "sudo ansible-playbook -i ./ansible_inventory ./ansible_playbook.yml  --ssh-common-args='-o StrictHostKeyChecking=no'"
  }
  depends_on = [module.ec2_cluster]
}
