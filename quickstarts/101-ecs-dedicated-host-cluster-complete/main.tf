data "alicloud_zones" default {}

resource "alicloud_ecs_dedicated_host_cluster" "default" {
  description = var.name
  dry_run     = var.dry_run_var
  tags = {
    Created = "TF"
    For     = "DDH_Cluster_Test"
  }
  zone_id                     = data.alicloud_zones.default.zones.0.id
  dedicated_host_cluster_name = var.name
}
