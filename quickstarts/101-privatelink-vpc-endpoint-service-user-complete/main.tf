resource "alicloud_ram_user" "user" {
  name         = "tf-exampleVpcEndpointServiceUserTest7166834"
  display_name = "user_display_name"
  mobile       = "86-18688888888"
  email        = "hello.uuu@aaa.com"
  comments     = "yoyoyo"
}

resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = "tf-exampleVpcEndpointServiceUserTest7166834"
  connect_bandwidth      = 103
  auto_accept_connection = false
}

resource "alicloud_privatelink_vpc_endpoint_service_user" "default" {
  service_id = alicloud_privatelink_vpc_endpoint_service.default.id
  user_id    = alicloud_ram_user.user.id
}
