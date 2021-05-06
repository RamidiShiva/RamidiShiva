variable "region" {
  default = "us-east-2"
}

variable "author" {
  default = "Priom"
}

variable "environment" {
  default = "PROD"
}

variable "project_name" {
  default = "gossamer"
}

variable "instance_type" {
  default = "t3a.medium"
}
  
variable "instance_count" {
  default = "8"
  type    = number
}

variable "linux_os_username" {
  default = "ubuntu" #it is default for ubuntu
  type    = string
}

variable "master_ssh_key" {
  default = "master"
  type    = string
}

variable "master_ssh_private_key_file" {
  #default = "~/.ssh/shiva.pem"
  #  default = "/mnt/d/shiva.pem"
  type    = string
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = true
}

variable "cidr" {
  default = "10.83.0.0/16"
  type    = string
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.83.1.0/24", "10.83.2.0/24", "10.83.3.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.83.101.0/24", "10.83.102.0/24", "10.83.103.0/24"]
}
