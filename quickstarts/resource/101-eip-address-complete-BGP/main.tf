data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_vpc_public_ip_address_pool" "default" {
  public_ip_address_pool_name = var.name
}

resource "alicloud_vpc_public_ip_address_pool_cidr_block" "default" {
  public_ip_address_pool_id = alicloud_vpc_public_ip_address_pool.default.id
  cidr_block                = "47.118.126.0/25"
}

resource "alicloud_eip_address" "default" {
  internet_charge_type      = "PayByTraffic"
  activity_id               = var.activity_id_var
  bandwidth                 = var.bandwidth_var
  description               = var.description_var
  isp                       = "BGP"
  netmode                   = "public"
  public_ip_address_pool_id = alicloud_vpc_public_ip_address_pool_cidr_block.default.public_ip_address_pool_id
  address_name              = var.address_name_var
  deletion_protection       = var.deletion_protection_var
  resource_group_id         = data.alicloud_resource_manager_resource_groups.default.ids.0
  payment_type              = "PayAsYouGo"
  tags = {
    Create = "tfTest Update"
    For    = "tfTest 123 Update"
  }
}
