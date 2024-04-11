variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "me-east-1"
}

variable "spec" {
  default = "20"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "me-east-1a"
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = "me-east-1a"
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_vpn_gateway" "default" {
  vpn_type         = "Normal"
  vpn_gateway_name = var.name

  vswitch_id   = local.vswitch_id
  auto_pay     = true
  vpc_id       = data.alicloud_vpcs.default.ids.0
  network_type = "public"
  payment_type = "Subscription"
  enable_ipsec = true
  bandwidth    = var.spec
}