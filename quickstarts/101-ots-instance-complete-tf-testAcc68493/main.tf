resource "alicloud_ots_instance" "default" {
  instance_type = "Capacity"
  name          = "tf-example68493"
  tags = {
    Created = "TF"
    For     = "acceptance test"
    Updated = "TF"
  }
  accessed_by = var.accessed_by_var
  description = "tf-example68493"
}
