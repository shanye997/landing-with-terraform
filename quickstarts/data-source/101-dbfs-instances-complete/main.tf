resource "alicloud_dbfs_instance" "default" {
  category          = "standard"
  zone_id           = "cn-hangzhou-i"
  performance_level = "PL1"
  instance_name     = var.name
  size              = 100
}

data "alicloud_dbfs_instances" "default" {
  name_regex = alicloud_dbfs_instance.default.instance_name
  status     = "attaching"
  ids = [
    alicloud_dbfs_instance.default.id
  ]
}
