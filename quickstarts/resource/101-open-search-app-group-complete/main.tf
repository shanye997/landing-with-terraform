resource "alicloud_open_search_app_group" "default" {
  type           = "standard"
  app_group_name = "tf_exampleosappgroup206"
  charge_way     = var.charge_way_var
  description    = var.description_var
  order_type     = var.order_type_var
  payment_type   = "PayAsYouGo"
  quota {
    doc_size         = "20"
    spec             = "opensearch.share.compute"
    compute_resource = "1000"
  }

}
