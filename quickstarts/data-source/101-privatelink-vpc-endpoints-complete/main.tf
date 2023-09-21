data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "default" {
  name        = "tf-example-for-privatelink"
  description = "privatelink test security group"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = ""
  connect_bandwidth      = 103
  auto_accept_connection = false
}

resource "alicloud_privatelink_vpc_endpoint" "default" {
  service_id         = alicloud_privatelink_vpc_endpoint_service.default.id
  vpc_id             = data.alicloud_vpcs.default.ids.0
  security_group_ids = [alicloud_security_group.default.id]
  vpc_endpoint_name  = "tf-examplePrivatelinkVpcEndpoints2057240"
  depends_on         = [alicloud_privatelink_vpc_endpoint_service.default]
}

data "alicloud_privatelink_vpc_endpoints" "default" {
  connection_status = "Pending"
  enable_details    = var.enable_details_var
  ids = [
    "${alicloud_privatelink_vpc_endpoint.default.id}-fake"
  ]
  name_regex = "tf-examplePrivatelinkVpcEndpoints2057240_fake"
  status     = "Creating"
}
