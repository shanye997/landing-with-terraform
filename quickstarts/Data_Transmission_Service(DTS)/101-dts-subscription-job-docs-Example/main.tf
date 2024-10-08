variable "name" {
  default = "terraform-example"
}
data "alicloud_regions" "example" {
  current = true
}
data "alicloud_db_zones" "example" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "example" {
  zone_id                  = data.alicloud_db_zones.example.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

resource "alicloud_vpc" "example" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "example" {
  vpc_id       = alicloud_vpc.example.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_db_zones.example.zones.0.id
  vswitch_name = var.name
}

resource "alicloud_security_group" "example" {
  name   = var.name
  vpc_id = alicloud_vpc.example.id
}

resource "alicloud_db_instance" "example" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_type            = data.alicloud_db_instance_classes.example.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.example.instance_classes.0.storage_range.min
  instance_charge_type     = "Postpaid"
  instance_name            = var.name
  vswitch_id               = alicloud_vswitch.example.id
  monitoring_period        = "60"
  db_instance_storage_type = "cloud_essd"
  security_group_ids       = [alicloud_security_group.example.id]
}

resource "alicloud_rds_account" "example" {
  db_instance_id   = alicloud_db_instance.example.id
  account_name     = "test_mysql"
  account_password = "N1cetest"
}

resource "alicloud_db_database" "example" {
  instance_id = alicloud_db_instance.example.id
  name        = var.name
}

resource "alicloud_db_account_privilege" "example" {
  instance_id  = alicloud_db_instance.example.id
  account_name = alicloud_rds_account.example.account_name
  privilege    = "ReadWrite"
  db_names     = [alicloud_db_database.example.name]
}

resource "alicloud_dts_subscription_job" "example" {
  dts_job_name                  = var.name
  payment_type                  = "PayAsYouGo"
  source_endpoint_engine_name   = "MySQL"
  source_endpoint_region        = data.alicloud_regions.example.regions.0.id
  source_endpoint_instance_type = "RDS"
  source_endpoint_instance_id   = alicloud_db_instance.example.id
  source_endpoint_database_name = alicloud_db_database.example.name
  source_endpoint_user_name     = alicloud_rds_account.example.account_name
  source_endpoint_password      = alicloud_rds_account.example.account_password
  db_list = jsonencode(
    {
      "${alicloud_db_database.example.name}" = { name = alicloud_db_database.example.name, all = true }
    }
  )
  subscription_instance_network_type = "vpc"
  subscription_instance_vpc_id       = alicloud_vpc.example.id
  subscription_instance_vswitch_id   = alicloud_vswitch.example.id
  status                             = "Normal"
}