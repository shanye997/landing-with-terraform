resource "alicloud_iot_device_group" "default" {
  group_desc = var.group_desc_var
  group_name = "tf_exampleiot429"
}
