provider "alicloud" {
  alias = "ccn_account"
}

resource "alicloud_cen_instance" "cen" {
  provider = "alicloud.cen_account"
  name     = "${var.name}"
}

resource "alicloud_cloud_connect_network" "ccn" {
  provider   = "alicloud.ccn_account"
  name       = "${var.name}"
  is_default = "true"
}

resource "alicloud_cloud_connect_network_grant" "default" {
  depends_on = [
    alicloud_cloud_connect_network.ccn,
    alicloud_cen_instance.cen
  ]
  ccn_id  = alicloud_cloud_connect_network.ccn.id
  cen_id  = alicloud_cen_instance.cen.id
  cen_uid = ""
  count   = "3"
}
