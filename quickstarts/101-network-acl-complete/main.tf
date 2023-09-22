data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  cidr_block = "192.168.0.0/16"
  vpc_name   = var.name
}

resource "alicloud_vswitch" "default0" {
  vpc_id       = alicloud_vpc.default.id
  vswitch_name = var.name
  cidr_block   = cidrsubnets(alicloud_vpc.default.cidr_block, 4, 4)[0]
  zone_id      = data.alicloud_zones.default.ids.0
}

resource "alicloud_network_acl" "default" {
  ingress_acl_entries {
    description            = "ingress test change"
    network_acl_entry_name = "tf-example78999"
    policy                 = "accept"
    port                   = "20/80"
    protocol               = "tcp"
    source_cidr_ip         = "10.0.0.0/24"
  }

  description = var.description_var
  vpc_id      = alicloud_vpc.default.id
  resources {
    resource_id   = alicloud_vswitch.default0.id
    resource_type = "VSwitch"
  }

  tags = {
    Created = "TF"
    For     = "Test"
  }
  network_acl_name = var.network_acl_name_var
  egress_acl_entries {
    protocol               = "tcp"
    description            = "engress test change"
    destination_cidr_ip    = "10.0.0.0/24"
    network_acl_entry_name = "tf-example78924"
    policy                 = "accept"
    port                   = "20/80"
  }

}
