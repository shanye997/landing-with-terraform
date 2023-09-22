data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "default" {
  name        = "tf-example-for-privatelink"
  description = "privatelink test security group"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default2" {
  name        = "tf-example84336"
  description = "privatelink test security group2"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = "tf-example84336"
  connect_bandwidth      = 103
  auto_accept_connection = false
}

resource "alicloud_privatelink_vpc_endpoint" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  security_group_ids = [
    alicloud_security_group.default.id,
    alicloud_security_group.default2.id
  ]
  depends_on = [
    alicloud_privatelink_vpc_endpoint_service.default
  ]
}
