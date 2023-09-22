data "alicloud_mongodb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_mongodb_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  zone_id    = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.vswitches.0.zone_id : data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.this.*.id, [""])[0]
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_mongodb_sharding_instance" "default" {
  instance_charge_type = var.instance_charge_type_var
  vswitch_id           = local.vswitch_id
  tde_status           = var.tde_status_var
  name                 = var.name_var
  shard_list {
    node_class   = "dds.shard.mid"
    node_storage = "10"
  }
  shard_list {
    node_class        = "dds.shard.standard"
    node_storage      = "20"
    readonly_replicas = "1"
  }
  shard_list {
    node_class        = "dds.shard.standard"
    node_storage      = "20"
    readonly_replicas = "2"
  }

  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  mongo_list {
    node_class = "dds.mongos.mid"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }

  protocol_type = "mongodb"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  backup_time      = var.backup_time_var
  zone_id          = local.zone_id
  account_password = var.account_password_var
  vpc_id           = data.alicloud_vpcs.default.ids.0
  storage_engine   = "WiredTiger"
  engine_version   = "4.2"
  security_ip_list = [
    "10.168.1.12"
  ]
  backup_period = [
    "Wednesday"
  ]
  network_type = "VPC"
}
