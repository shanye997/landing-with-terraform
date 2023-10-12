resource "alicloud_cloud_connect_network" "default" {
  description = var.description_var
  is_default  = var.is_default_var
  name        = var.name_var
  cidr_block  = var.cidr_block_var
}
