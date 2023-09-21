data "alicloud_elasticsearch_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_elasticsearch_zones.default.ids.0
}

resource "alicloud_elasticsearch_instance" "default" {
  description          = var.name
  password             = "Yourpassword1234"
  vswitch_id           = data.alicloud_vswitches.default.ids.0
  data_node_amount     = "2"
  data_node_spec       = "elasticsearch.sn2ne.large"
  data_node_disk_size  = "20"
  data_node_disk_type  = "cloud_ssd"
  instance_charge_type = "PostPaid"
  version              = "5.5.3_with_X-Pack"
  tags = {
    "Created" : "TF",
    "For" : "acceptance test",
  }
}

data "alicloud_elasticsearch_instances" "default" {
  description_regex = "${alicloud_elasticsearch_instance.default.description}-F"
  ids = [
    alicloud_elasticsearch_instance.default.id
  ]
  tags = {
    Created = "TF-fake"
    For     = "acceptance test"
  }
  version = var.version_var
}
