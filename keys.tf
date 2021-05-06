locals {
  ssh_keys = {
    key = fileset("./ssh_keys/", "*.pub")
  }
}

###Upload keys to AWS
resource "aws_key_pair" "ssh_keys" {
  for_each = fileset("./ssh_keys/", "*.pub")

  key_name   = trim("${each.key}", ".pub")
  public_key = file("./ssh_keys/${each.key}")
  tags = merge(
    local.common_tags,
    tomap({
      "Name" = "${var.project_name}-key"
    })
  )
}