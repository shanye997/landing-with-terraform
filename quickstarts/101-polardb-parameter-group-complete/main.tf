resource "alicloud_polardb_parameter_group" "default" {
  db_type     = "MySQL"
  db_version  = "8.0"
  description = "tf-examplecn-hangzhouPolarDBParameterGroup-name13468"
  name        = "tf_example"
  parameters {
    param_name  = "wait_timeout"
    param_value = "86400"
  }
  parameters {
    param_name  = "innodb_old_blocks_time"
    param_value = "1000"
  }

}
