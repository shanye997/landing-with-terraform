variable "name" {
  default = "tf-example"
}
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}
resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_cr_ee_instance" "default" {
  payment_type   = "Subscription"
  period         = 1
  renew_period   = 0
  renewal_status = "ManualRenewal"
  instance_type  = "Advanced"
  instance_name  = var.name
}

resource "alicloud_cr_vpc_endpoint_linked_vpc" "default" {
  instance_id                      = alicloud_cr_ee_instance.default.id
  vpc_id                           = alicloud_vpc.default.id
  vswitch_id                       = alicloud_vswitch.default.id
  module_name                      = "Registry"
  enable_create_dns_record_in_pvzt = true
}