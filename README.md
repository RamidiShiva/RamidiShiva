###############################    
### GOSSAMER AUTO PROVISION ###
###############################

1. put all ssh public keys in "ssh_keys" directory with .pub file extension
2. set terraform cloud backed configuration in main.tf
3. set "shared_credentials_file" & "profile" variables in providers.tf
4. set master_ssh_key variable in variables.tf as a master key for accessing ec2 instance via ansible.
5. set master_ssh_private_key_file in in variables.tf as a master key - private key
6. terraform init
7. terraform apply
8. install "sudo ansible-galaxy collection install community.general" 