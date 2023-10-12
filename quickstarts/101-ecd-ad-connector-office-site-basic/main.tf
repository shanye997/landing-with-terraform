resource "alicloud_cen_instance" "default" {
  cen_instance_name = "${var.name}"
  protection_level  = "REDUCED"
}

resource "alicloud_ecd_ad_connector_office_site" "default" {
  cidr_block                    = "10.0.0.0/12"
  ad_connector_office_site_name = var.name
  cen_id                        = alicloud_cen_instance.default.id
  dns_address = [
    "127.0.0.2"
  ]
  domain_name = var.domain_name_var
}
