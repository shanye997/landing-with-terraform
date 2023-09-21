data "alicloud_zones" default {}

resource "alicloud_ecs_dedicated_host_cluster" "default" {
  dedicated_host_cluster_name = var.name
  description                 = var.name
  zone_id                     = data.alicloud_zones.default.zones.0.id
  tags = {
    Create = "TF"
    For    = "DDH_Cluster_Test",
  }
}

data "alicloud_ecs_dedicated_host_clusters" "default" {
  dedicated_host_cluster_ids = [
    "${alicloud_ecs_dedicated_host_cluster.default.id}-fake"
  ]
  dedicated_host_cluster_name = "${alicloud_ecs_dedicated_host_cluster.default.dedicated_host_cluster_name}-fake"
  ids = [
    alicloud_ecs_dedicated_host_cluster.default.id
  ]
  name_regex = "${alicloud_ecs_dedicated_host_cluster.default.dedicated_host_cluster_name}-fake"
  tags = {
    Create = "DDH_Cluster_Test"
    For    = "TF"
  }
  zone_id = "${alicloud_ecs_dedicated_host_cluster.default.zone_id}-fake"
}
