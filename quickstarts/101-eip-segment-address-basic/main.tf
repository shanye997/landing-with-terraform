resource "alicloud_eip_segment_address" "default" {
  eip_mask = var.eip_mask_var
}
