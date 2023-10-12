data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_static_account" "default" {
  access_key  = ""
  instance_id = data.alicloud_amqp_instances.default.ids.0
  secret_key  = ""
}
