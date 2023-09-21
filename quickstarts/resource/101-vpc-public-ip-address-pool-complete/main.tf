resource "alicloud_resource_manager_resource_group" "defaultRg" {
  display_name        = "tf-example-publicaddresspool-916"
  resource_group_name = "tf-example-publicaddresspool-688"
}

resource "alicloud_vpc_public_ip_address_pool" "default" {
  description                 = var.description_var
  isp                         = "BGP_PRO"
  public_ip_address_pool_name = var.public_ip_address_pool_name_var
  resource_group_id           = alicloud_resource_manager_resource_group.defaultRg.id
  tags = {
    Created = "TF"
    For     = "Test"
  }
}
