resource "alicloud_data_works_folder" "default" {
  project_id  = "638"
  folder_path = "Business Flow/tfexample/folderDi/tftest1"
}

data "alicloud_data_works_folders" "default" {
  project_id = alicloud_data_works_folder.default.project_id
  ids = [
    "${alicloud_data_works_folder.default.folder_id}_fake"
  ]
  parent_folder_path = "Business Flow/tfexample/folderDi"
}
