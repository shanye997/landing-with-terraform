resource "alicloud_imm_project" "default" {
  project      = "tf-examplecn-hangzhouimmproject65579"
  service_role = var.service_role_var
}
