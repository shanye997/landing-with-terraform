variable "name" {
  default = "tf-example"
}

resource "alicloud_ons_instance" "example" {
  instance_name = var.name
  remark        = var.name
}