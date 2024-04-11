variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "cn-hangzhou"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "defaultVpc" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = var.name

}

resource "alicloud_vswitch" "defaultyVSwitch" {
  vpc_id       = alicloud_vpc.defaultVpc.id
  cidr_block   = "172.16.2.0/24"
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name

}


resource "alicloud_ack_one_cluster" "default" {
  network {
    vpc_id    = alicloud_vpc.defaultVpc.id
    vswitches = ["${alicloud_vswitch.defaultyVSwitch.id}"]
  }
}