data "alicloud_vpcs" "vpcs_ds" {
  name_regex = "^cfw-vpc-test-no-deleting"
}

data "alicloud_route_tables" "local_vpc" {
  vpc_id = data.alicloud_vpcs.vpcs_ds.vpcs.0.id
}

data "alicloud_vpcs" "vpcs_ds_peer" {
  name_regex = "^cfw-vpc-peer-test-no-deleting"
}

data "alicloud_route_tables" "local_peer" {
  vpc_id = data.alicloud_vpcs.vpcs_ds_peer.vpcs.0.id
}

data "alicloud_vpc_peer_connections" "cfw_vpc_peer" {
  name_regex = "^cfw-vpc-test-no-deleting"
}

resource "alicloud_cloud_firewall_vpc_firewall" "default" {
  peer_vpc {
    peer_vpc_cidr_table_list {
      peer_route_entry_list {
        peer_next_hop_instance_id = data.alicloud_vpc_peer_connections.cfw_vpc_peer.connections.0.id
        peer_destination_cidr     = data.alicloud_vpcs.vpcs_ds.vpcs.0.cidr_block
      }

      peer_route_table_id = data.alicloud_route_tables.local_peer.tables.0.id
    }

    region_no = "cn-hangzhou"
    vpc_id    = data.alicloud_vpcs.vpcs_ds_peer.vpcs.0.id
  }

  vpc_firewall_name = var.vpc_firewall_name_var
  local_vpc {
    local_vpc_cidr_table_list {
      local_route_entry_list {
        local_destination_cidr     = data.alicloud_vpcs.vpcs_ds_peer.vpcs.0.cidr_block
        local_next_hop_instance_id = data.alicloud_vpc_peer_connections.cfw_vpc_peer.connections.0.id
      }

      local_route_table_id = data.alicloud_route_tables.local_vpc.tables.0.id
    }

    region_no = "cn-hangzhou"
    vpc_id    = data.alicloud_vpcs.vpcs_ds.vpcs.0.id
  }

  status = var.status_var
}
