data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_physical_connection" "default" {
  order_mode                    = "PayByPhysicalConnectionOwner"
  vlan_id                       = var.vlan_id_var
  vpconn_ali_uid                = var.vpconn_ali_uid
  spec                          = "50M"
  parent_physical_connection_id = data.alicloud_express_connect_physical_connections.default.ids.0
}
