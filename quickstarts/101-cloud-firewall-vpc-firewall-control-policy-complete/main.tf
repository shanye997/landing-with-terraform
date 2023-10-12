data "alicloud_account" "current" {
}

resource "alicloud_cloud_firewall_address_book" "default" {
  description  = "tf-exampleAddressBook"
  group_name   = var.name
  group_type   = "ip"
  address_list = ["10.21.0.0/16", "10.168.0.0/16"]
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  description       = "tf-exampleCenConfigDescription"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

resource "alicloud_cloud_firewall_vpc_firewall_control_policy" "default" {
  acl_action       = var.acl_action_var
  application_name = var.application_name_var
  dest_port        = var.dest_port_var
  proto            = var.proto_var
  member_uid       = data.alicloud_account.current.id
  release          = var.release_var
  description      = var.description_var
  source_type      = var.source_type_var
  destination_type = var.destination_type_var
  destination      = alicloud_cloud_firewall_address_book.default.group_name
  source           = alicloud_cloud_firewall_address_book.default.group_name
  order            = "1"
  dest_port_type   = var.dest_port_type_var
  lang             = var.lang_var
  vpc_firewall_id  = alicloud_cen_instance.default.id
}
