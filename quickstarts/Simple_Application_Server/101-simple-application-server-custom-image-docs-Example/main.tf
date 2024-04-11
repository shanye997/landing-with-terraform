variable "name" {
  default = "tf_example"
}

data "alicloud_simple_application_server_images" "default" {}
data "alicloud_simple_application_server_plans" "default" {}

resource "alicloud_simple_application_server_instance" "default" {
  payment_type   = "Subscription"
  plan_id        = data.alicloud_simple_application_server_plans.default.plans.0.id
  instance_name  = var.name
  image_id       = data.alicloud_simple_application_server_images.default.images.0.id
  period         = 1
  data_disk_size = 100
}

data "alicloud_simple_application_server_disks" "default" {
  instance_id = alicloud_simple_application_server_instance.default.id
}

resource "alicloud_simple_application_server_snapshot" "default" {
  disk_id       = data.alicloud_simple_application_server_disks.default.ids.0
  snapshot_name = var.name
}

resource "alicloud_simple_application_server_custom_image" "default" {
  custom_image_name  = var.name
  instance_id        = alicloud_simple_application_server_instance.default.id
  system_snapshot_id = alicloud_simple_application_server_snapshot.default.id
  status             = "Share"
  description        = var.name
}