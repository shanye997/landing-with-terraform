data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_physical_connection" "default" {
  virtual_physical_connection_name = "amp_resource_test"
  expect_spec                      = var.expect_spec_var
  parent_physical_connection_id    = data.alicloud_express_connect_physical_connections.default.ids.0
  spec                             = "50M"
  resource_group_id                = data.alicloud_resource_manager_resource_groups.default.ids.0
  vpconn_ali_uid                   = var.vpconn_ali_uid
  vlan_id                          = var.vlan_id_var
  description                      = "amp_resource_test"
  order_mode                       = "PayByPhysicalConnectionOwner"
}
