resource "alicloud_open_search_app_group" "default" {
  quota {
    compute_resource = "1000"
    doc_size         = "20"
    spec             = "opensearch.share.compute"
  }

  payment_type   = "PayAsYouGo"
  type           = "standard"
  app_group_name = "tf_exampleosappgroup206"
}
