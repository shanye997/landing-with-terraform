resource "alicloud_ecs_hpc_cluster" "default" {
  description = var.description_var
  name        = var.name_var
}
