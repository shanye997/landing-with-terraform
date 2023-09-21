data "alicloud_zones" default {}

resource "alicloud_ecs_dedicated_host_cluster" "default" {
  zone_id = data.alicloud_zones.default.zones.0.id
}
