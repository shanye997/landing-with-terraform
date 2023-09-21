data "alicloud_ebs_regions" "default" {
  region_id = var.region
}

resource "alicloud_ebs_disk_replica_group" "default" {
  source_zone_id        = data.alicloud_ebs_regions.default.regions[0].zones[0].zone_id
  description           = var.description_var
  destination_region_id = var.region
  destination_zone_id   = data.alicloud_ebs_regions.default.regions[0].zones[1].zone_id
  group_name            = var.group_name_var
  rpo                   = "900"
  source_region_id      = var.region
}
