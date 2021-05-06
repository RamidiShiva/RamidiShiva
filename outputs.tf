output "server_ips" {
  value = module.ec2_cluster.public_ip
}

output "ssh_keys" {
  value = local.ssh_keys.key
}

###Create Ansible inventory file
resource "local_file" "ansible_inventory" {
  filename = "ansible_inventory"
  content  = <<-EOT
[all:vars]
ansible_user='${var.linux_os_username}'
ansible_ssh_private_key_file='${var.master_ssh_private_key_file}'

[servers]
%{for index, dns in module.ec2_cluster.public_ip~}
${dns} ansible_host=${module.ec2_cluster.public_ip[index]}
%{endfor~}
EOT
}