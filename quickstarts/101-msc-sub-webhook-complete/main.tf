resource "alicloud_msc_sub_webhook" "default" {
  server_url   = var.server_url_var
  webhook_name = var.name
}
