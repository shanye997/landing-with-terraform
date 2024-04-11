data "alicloud_account" "current" {
}

resource "alicloud_cloud_firewall_vpc_firewall" "default" {
  vpc_firewall_name = "tf-example"
  member_uid        = data.alicloud_account.current.id
  local_vpc {
    vpc_id    = "vpc-bp1d065m6hzn1xbw8ibfd"
    region_no = "cn-hangzhou"
    local_vpc_cidr_table_list {
      local_route_table_id = "vtb-bp1lj0ddg846856chpzrv"
      local_route_entry_list {
        local_next_hop_instance_id = "ri-bp1uobww3aputjlwwkyrh"
        local_destination_cidr     = "10.1.0.0/16"
      }
    }
  }
  peer_vpc {
    vpc_id    = "vpc-bp1gcmm64o3caox84v0nz"
    region_no = "cn-hangzhou"
    peer_vpc_cidr_table_list {
      peer_route_table_id = "vtb-bp1f516f2hh4sok1ig9b5"
      peer_route_entry_list {
        peer_destination_cidr     = "10.0.0.0/16"
        peer_next_hop_instance_id = "ri-bp1thhtgf6ydr2or52l3n"
      }
    }
  }
  status = "open"
}