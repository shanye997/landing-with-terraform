resource "alicloud_mongodb_sharding_instance" "default" {
  mongo_list {
    node_class = "dds.mongos.mid"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }
  mongo_list {
    node_class = "dds.mongos.mid"
  }

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
    readonly_replicas = "2"
    node_class        = "dds.shard.standard"
    node_storage      = "20"
  }

  engine_version = "4.2"
}
