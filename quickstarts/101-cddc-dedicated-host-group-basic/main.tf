data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  engine = "alisql"
}
