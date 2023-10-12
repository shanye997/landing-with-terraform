resource "alicloud_sddp_rule" "default" {
  status           = var.status_var
  risk_level_id    = var.risk_level_id_var
  lang             = var.lang_var
  description      = var.description_var
  rule_type        = var.rule_type_var
  target           = var.target_var
  rule_name        = "${var.name}-all"
  category         = "0"
  content_category = var.content_category_var
  content          = "tf-example-all"
  stat_express     = var.stat_express_var
  product_code     = var.product_code_var
  warn_level       = var.warn_level_var
  product_id       = var.product_id_var
}
