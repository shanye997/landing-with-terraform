resource "alicloud_dms_enterprise_logic_database" "default" {
  alias = "TF_logic_db_test"
  database_ids = [
    "35617919", "35617920"
  ]
}