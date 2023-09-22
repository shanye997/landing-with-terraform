resource "alicloud_cen_instance" "default" {
  protection_level  = var.protection_level_var
  cen_instance_name = var.cen_instance_name_var
  tags = {
    Created = "TF"
  }
  description = var.description_var
}
