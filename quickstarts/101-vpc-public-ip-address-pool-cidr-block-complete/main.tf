resource "alicloud_vpc_public_ip_address_pool" "default" {
  public_ip_address_pool_name = var.name
  isp                         = "BGP"
  description                 = var.name
}

resource "alicloud_vpc_public_ip_address_pool_cidr_block" "default" {
  cidr_block                = "47.118.126.0/25"
  public_ip_address_pool_id = alicloud_vpc_public_ip_address_pool.default.id
}
