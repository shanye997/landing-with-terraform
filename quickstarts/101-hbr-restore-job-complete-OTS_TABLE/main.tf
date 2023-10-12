data "alicloud_hbr_ots_snapshots" "default" {
}

resource "alicloud_hbr_restore_job" "default" {
  snapshot_hash        = data.alicloud_hbr_ots_snapshots.default.snapshots.0.snapshot_hash
  snapshot_id          = data.alicloud_hbr_ots_snapshots.default.snapshots.0.snapshot_id
  target_instance_name = data.alicloud_hbr_ots_snapshots.default.snapshots.0.instance_name
  vault_id             = data.alicloud_hbr_ots_snapshots.default.snapshots.0.vault_id
  include              = data.alicloud_hbr_ots_snapshots.default.snapshots.0.table_name
  restore_type         = "OTS_TABLE"
  target_table_name    = data.alicloud_hbr_ots_snapshots.default.snapshots.0.table_name
  target_time          = data.alicloud_hbr_ots_snapshots.default.snapshots.0.start_time
  ots_detail {
    overwrite_existing = "true"
  }

  source_type = "OTS_TABLE"
}
