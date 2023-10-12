resource "alicloud_ga_acl" "default" {
  address_ip_version = "IPv4"
  tags = {
    Created = "TF"
    For     = "Acl"
  }
  acl_name = var.acl_name_var
}
