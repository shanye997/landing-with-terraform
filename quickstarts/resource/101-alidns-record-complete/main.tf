resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoualidnsrecordbasic6807300477259723298.abc"
}

resource "alicloud_alidns_record" "default" {
  status      = var.status_var
  priority    = var.priority_var
  remark      = var.remark_var
  type        = var.type_var
  domain_name = alicloud_dns.default.name
  rr          = var.rr_var
  line        = var.line_var
  value       = var.value_var
  ttl         = var.ttl_var
}
