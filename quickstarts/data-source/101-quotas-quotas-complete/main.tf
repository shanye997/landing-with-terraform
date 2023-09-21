data "alicloud_quotas_quotas" "default" {
  quota_action_code = "q_dedicated-hosts-fake"
  name_regex        = "专有宿主机总数量上限-fake"
  product_code      = "ecs"
}
