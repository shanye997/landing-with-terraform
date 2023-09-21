data "alicloud_simple_application_server_images" "default" {
  platform = "Linux"
}

data "alicloud_simple_application_server_plans" "default" {
  platform = "Linux"
}

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
  snapshot_name = var.name
  disk_id       = data.alicloud_simple_application_server_disks.default.ids.0
}

data "alicloud_simple_application_server_snapshots" "default" {
  instance_id = "${data.alicloud_simple_application_server_disks.default.disks.0.instance_id}-fake"
  name_regex  = "${alicloud_simple_application_server_snapshot.default.snapshot_name}-fake"
  status      = "Failed"
  disk_id     = "${alicloud_simple_application_server_snapshot.default.disk_id}-fake"
  ids = [
    alicloud_simple_application_server_snapshot.default.id
  ]
}
