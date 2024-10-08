variable "name" {
  default = "terraform-example"
}

data "alicloud_mongodb_zones" "default" {
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.17.3.0/24"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "172.17.3.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_mongodb_zones.default.zones.0.id
}

resource "alicloud_mongodb_sharding_instance" "default" {
  zone_id        = data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id     = alicloud_vswitch.default.id
  engine_version = "4.2"
  name           = var.name
  shard_list {
    node_class   = "dds.shard.mid"
    node_storage = "10"
  }
  shard_list {
    node_class        = "dds.shard.standard"
    node_storage      = "20"
    readonly_replicas = "1"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }
}

resource "alicloud_mongodb_sharding_network_private_address" "default" {
  db_instance_id   = alicloud_mongodb_sharding_instance.default.id
  node_id          = alicloud_mongodb_sharding_instance.default.shard_list.0.node_id
  zone_id          = alicloud_mongodb_sharding_instance.default.zone_id
  account_name     = "example"
  account_password = "Example_123"
}