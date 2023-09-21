data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_ecs_key_pair" "default" {
  key_name          = "tf-exampleEcsKeyPairsTest1554"
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  tags = {
    Create = "TF"
    For    = "Ecs Key Pairs",
  }
}

data "alicloud_ecs_key_pairs" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  tags = {
    Create = "TF-fake"
    For    = "Ecs Key Pairs Fake"
  }
  ids = [
    "${alicloud_ecs_key_pair.default.id}-fake"
  ]
  name_regex = "tf-exampleEcsKeyPairsTest1554fake"
}
