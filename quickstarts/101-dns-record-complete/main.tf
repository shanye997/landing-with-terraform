resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoudnsrecordbasic3417545473723623812.abc"
}

resource "alicloud_dns_record" "default" {
  routing     = var.routing_var
  ttl         = var.ttl_var
  type        = var.type_var
  value       = var.value_var
  host_record = var.host_record_var
  name        = alicloud_dns.default.name
  priority    = var.priority_var
}
