variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "cn-hangzhou"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "tf-exampleacc-kms-instance"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vpc" "default" {
  count      = length(data.alicloud_vpcs.default.ids) > 0 ? 0 : 1
  cidr_block = "172.16.0.0/12"
  vpc_name   = "tf-exampleacc-kms-instance"
}

data "alicloud_vswitches" "vswitch" {
  vpc_id  = local.vpc_id
  zone_id = "cn-hangzhou-k"
}

data "alicloud_vswitches" "vswitch-j" {
  vpc_id  = local.vpc_id
  zone_id = "cn-hangzhou-j"
}

locals {
  vpc_id  = length(data.alicloud_vpcs.default.ids) > 0 ? data.alicloud_vpcs.default.ids.0 : concat(alicloud_vpc.default[*].id, [""])[0]
  vsw_id  = length(data.alicloud_vswitches.vswitch.ids) > 0 ? data.alicloud_vswitches.vswitch.ids.0 : concat(alicloud_vswitch.vswitch[*].id, [""])[0]
  vswj_id = length(data.alicloud_vswitches.vswitch-j.ids) > 0 ? data.alicloud_vswitches.vswitch-j.ids.0 : concat(alicloud_vswitch.vswitch-j[*].id, [""])[0]
}

resource "alicloud_vswitch" "vswitch" {
  count      = length(data.alicloud_vswitches.vswitch.ids) > 0 ? 0 : 1
  vpc_id     = local.vpc_id
  zone_id    = "cn-hangzhou-k"
  cidr_block = "172.16.1.0/24"
}

resource "alicloud_vswitch" "vswitch-j" {
  count      = length(data.alicloud_vswitches.vswitch-j.ids) > 0 ? 0 : 1
  vpc_id     = local.vpc_id
  zone_id    = "cn-hangzhou-j"
  cidr_block = "172.16.2.0/24"
}

resource "alicloud_vpc" "shareVPC" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = format("%s1", var.name)
}

resource "alicloud_vswitch" "shareVswitch" {
  vpc_id     = alicloud_vpc.shareVPC.id
  zone_id    = data.alicloud_zones.default.zones.1.id
  cidr_block = "172.16.1.0/24"
}

resource "alicloud_vpc" "share-VPC2" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = format("%s2", var.name)
}

resource "alicloud_vswitch" "share-vswitch2" {
  vpc_id     = alicloud_vpc.share-VPC2.id
  zone_id    = data.alicloud_zones.default.zones.1.id
  cidr_block = "172.16.1.0/24"
}

resource "alicloud_vpc" "share-VPC3" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = format("%s3", var.name)
}

resource "alicloud_vswitch" "share-vsw3" {
  vpc_id     = alicloud_vpc.share-VPC3.id
  zone_id    = data.alicloud_zones.default.zones.1.id
  cidr_block = "172.16.1.0/24"
}

resource "alicloud_kms_instance" "default" {
  product_version = "3"
  vpc_id          = local.vpc_id
  zone_ids = [
    "cn-hangzhou-k",
    "cn-hangzhou-j"
  ]
  vswitch_ids = [
    "${local.vsw_id}"
  ]
  vpc_num    = "1"
  key_num    = "1000"
  secret_num = "0"
  spec       = "1000"
}

# Save Instance's CA certificate chain to a local file
# resource "local_file" "ca_certificate_chain_pem" {
#   content  = alicloud_kms_instance.default.ca_certificate_chain_pem
#   filename = "ca.pem"
# }