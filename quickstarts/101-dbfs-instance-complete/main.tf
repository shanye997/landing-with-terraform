resource "alicloud_dbfs_instance" "default" {
  tags = {
    Created = "TF2"
    For     = "Test2"
    number  = "2"
  }
  zone_id           = "cn-hangzhou-i"
  category          = "standard"
  instance_name     = var.instance_name_var
  performance_level = "PL1"
  size              = var.size_var
}
