resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoualidnsrecordbasic6807300477259723298.abc"
}

resource "alicloud_alidns_record" "default" {
  domain_name = alicloud_dns.default.name
  rr          = var.rr_var
  value       = var.value_var
  type        = var.type_var
}
