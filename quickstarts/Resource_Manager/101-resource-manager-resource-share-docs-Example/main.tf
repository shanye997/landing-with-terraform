variable "name" {
  default = "tfexample"
}
resource "alicloud_resource_manager_resource_share" "example" {
  resource_share_name = var.name
}
