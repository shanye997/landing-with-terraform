data "alicloud_vpcs" "default" {
  name_regex = "tf-example-kms-instance"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vpc" "default" {
  count      = length(data.alicloud_vpcs.default.ids) > 0 ? 0 : 1
  cidr_block = "172.16.0.0/12"
  vpc_name   = "tf-example-kms-instance"
}

data "alicloud_vswitches" "vswitch" {
  vpc_id  = local.vpc_id
  zone_id = "cn-hangzhou-k"
}

locals {
  vpc_id = length(data.alicloud_vpcs.default.ids) > 0 ? data.alicloud_vpcs.default.ids.0 : concat(alicloud_vpc.default[*].id, [""])[0]
  vsw_id = length(data.alicloud_vswitches.vswitch.ids) > 0 ? data.alicloud_vswitches.vswitch.ids.0 : concat(alicloud_vswitch.vswitch[*].id, [""])[0]
}

resource "alicloud_vswitch" "vswitch" {
  count      = length(data.alicloud_vswitches.vswitch.ids) > 0 ? 0 : 1
  vpc_id     = local.vpc_id
  zone_id    = "cn-hangzhou-k"
  cidr_block = "172.16.1.0/24"
}

resource "alicloud_kms_instance" "default" {
  key_num = var.key_num_var
  bind_vpcs {
    region_id    = "cn-hangzhou"
    vpc_id       = "vpc-bp14c07ucxg6h1xjmgcld"
    vpc_owner_id = "1192853035118460"
    vswitch_id   = "vsw-bp1wujtnspi1l3gvunvds"
  }

  renew_status = var.renew_status_var
  secret_num   = var.secret_num_var
  renew_period = var.renew_period_var
  vpc_num      = var.vpc_num_var
  zone_ids = [
    "cn-hangzhou-k",
    "cn-hangzhou-j"
  ]
  product_version = var.product_version_var
  spec            = var.spec_var
  vpc_id          = local.vpc_id
  vswitch_ids = [
    local.vsw_id
  ]
}
