resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoudnsrecordbasic3417545473723623812.abc"
}

resource "alicloud_dns_record" "default" {
  value       = var.value_var
  name        = alicloud_dns.default.name
  host_record = var.host_record_var
  type        = var.type_var
}
