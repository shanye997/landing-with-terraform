resource "alicloud_dbfs_instance" "default" {
  instance_name = var.instance_name_var
  zone_id       = "cn-hangzhou-i"
  size          = var.size_var
}
