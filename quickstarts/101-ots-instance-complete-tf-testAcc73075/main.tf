resource "alicloud_ots_instance" "default" {
  name = "tf-example73075"
  tags = {
    Updated = "TF"
    Created = "TF"
    For     = "acceptance test"
  }
  accessed_by   = var.accessed_by_var
  description   = "tf-example73075"
  instance_type = "HighPerformance"
}
