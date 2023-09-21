resource "alicloud_sag_snat_entry" "default" {
  cidr_block = "10.10.0.0/24"
  sag_id     = ""
  snat_ip    = "11.0.0.2"
}
