resource "alicloud_imp_app_template" "default" {
  app_template_name = var.app_template_name_var
  component_list = [
    "component.live"
  ]
}
