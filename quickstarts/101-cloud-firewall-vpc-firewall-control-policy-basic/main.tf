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
  proto            = var.proto_var
  source           = alicloud_cloud_firewall_address_book.default.group_name
  destination      = alicloud_cloud_firewall_address_book.default.group_name
  description      = var.description_var
  acl_action       = var.acl_action_var
  destination_type = var.destination_type_var
  vpc_firewall_id  = alicloud_cen_instance.default.id
  application_name = var.application_name_var
  order            = "1"
  source_type      = var.source_type_var
}
