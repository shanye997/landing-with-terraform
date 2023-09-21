data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.ids.0
}

resource "alicloud_security_group" "default" {
  name        = var.name
  description = "tf test"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_eais_instance" "default" {
  instance_type     = "eais.ei-a6.medium"
  instance_name     = var.name
  security_group_id = alicloud_security_group.default.id
  vswitch_id        = data.alicloud_vswitches.default.ids.0
}

data "alicloud_eais_instances" "default" {
  name_regex = alicloud_eais_instance.default.instance_name
  status     = "Unavailable"
  ids = [
    alicloud_eais_instance.default.id
  ]
  instance_type = "eais.ei-a6.2xlarge"
}
