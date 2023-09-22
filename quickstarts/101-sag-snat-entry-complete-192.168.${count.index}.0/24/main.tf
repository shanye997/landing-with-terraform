resource "alicloud_sag_snat_entry" "default" {
  cidr_block = "192.168.${count.index}.0/24"
  count      = "5"
  sag_id     = ""
  snat_ip    = "192.0.0.${count.index}"
}
