resource "alicloud_ons_instance" "default" {
  tags = {
    Created = "TF"
  }
  instance_name = var.name
  remark        = var.remark_var
}
