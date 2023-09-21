data "alicloud_zones" "default" {
  available_resource_creation = "Rds"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = var.name
}

resource "alicloud_db_instance" "default" {
  engine           = "MySQL"
  engine_version   = "5.6"
  instance_type    = "rds.mysql.s1.small"
  instance_storage = "10"
  vswitch_id       = alicloud_vswitch.default.id
  instance_name    = var.name
}

resource "alicloud_db_account" "default" {
  db_instance_id = alicloud_db_instance.default.id
  account_name   = "tftestnormal"
  password       = "YourPassword12345!"
}

resource "alicloud_kms_secret" "default" {
  extended_config               = "{\"CustomData\":{\"test\":\"test\"},\"DBInstanceId\":\"${alicloud_db_account.default.db_instance_id}\",\"SecretSubType\":\"SingleUser\"}"
  secret_name                   = "tf_exampleKmsSecret_7606862"
  version_id                    = var.version_id_var
  secret_type                   = "Rds"
  secret_data                   = var.secret_data_var
  description                   = var.description_var
  force_delete_without_recovery = var.force_delete_without_recovery_var
  secret_data_type              = var.secret_data_type_var
  tags = {
    Created = "TF"
    Name    = "tf_exampleKmsSecret_7606862"
  }
}
