resource "alicloud_sae_namespace" "default" {
  namespace_description = "namespace_desc"
  namespace_id          = "cn-hangzhou:configmaptest2"
  namespace_name        = "namespace_name"
}

resource "alicloud_sae_config_map" "default" {
  namespace_id = alicloud_sae_namespace.default.namespace_id
  data         = var.data_var
  description  = var.description_var
  name         = "tfexamplename"
}
