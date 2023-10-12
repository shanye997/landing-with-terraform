resource "alicloud_eip_segment_address" "default" {
  internet_charge_type = var.internet_charge_type_var
  isp                  = var.isp_var
  netmode              = var.netmode_var
  bandwidth            = var.bandwidth_var
  eip_mask             = var.eip_mask_var
}
