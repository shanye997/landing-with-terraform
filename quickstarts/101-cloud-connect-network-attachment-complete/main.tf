resource "alicloud_cloud_connect_network" "ccn" {
  name       = "${var.name}"
  is_default = "true"
}

resource "alicloud_cloud_connect_network_attachment" "default" {
  depends_on = [
    alicloud_cloud_connect_network.ccn
  ]
  sag_id = ""
  ccn_id = alicloud_cloud_connect_network.ccn.id
}
