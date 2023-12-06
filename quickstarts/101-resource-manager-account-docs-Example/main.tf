variable "name" {
  default = "tf-example"
}
variable "display_name" {
  default = "EAccount"
}

resource "alicloud_resource_manager_folder" "example" {
  folder_name = var.name
}

resource "alicloud_resource_manager_account" "example" {
  display_name = var.display_name
  folder_id    = alicloud_resource_manager_folder.example.id
}
