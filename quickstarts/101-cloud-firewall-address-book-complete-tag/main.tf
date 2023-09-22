resource "alicloud_cloud_firewall_address_book" "default" {
  description = var.description_var
  ecs_tags {
    tag_value = "tfexample0"
    tag_key   = "created"
  }
  ecs_tags {
    tag_key   = "for"
    tag_value = "tfexample1"
  }
  ecs_tags {
    tag_key   = "by"
    tag_value = "tfexample2"
  }

  group_name       = var.group_name_var
  group_type       = "tag"
  lang             = var.lang_var
  tag_relation     = var.tag_relation_var
  auto_add_tag_ecs = var.auto_add_tag_ecs_var
}
