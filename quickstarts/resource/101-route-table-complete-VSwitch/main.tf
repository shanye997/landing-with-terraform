resource "alicloud_vpc" "defaultVpc" {
  vpc_name = var.name
}

resource "alicloud_route_table" "default" {
  associate_type   = "VSwitch"
  description      = var.description_var
  route_table_name = var.route_table_name_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  vpc_id = alicloud_vpc.defaultVpc.id
}
