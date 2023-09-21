data "alicloud_ebs_regions" "default" {
  region_id = var.region
}

resource "alicloud_ebs_disk_replica_group" "default" {
  destination_zone_id   = data.alicloud_ebs_regions.default.regions[0].zones[1].zone_id
  source_region_id      = var.region
  source_zone_id        = data.alicloud_ebs_regions.default.regions[0].zones[0].zone_id
  destination_region_id = var.region
}
