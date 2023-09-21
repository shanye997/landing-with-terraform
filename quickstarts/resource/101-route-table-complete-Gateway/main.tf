resource "alicloud_vpc" "default" {
  vpc_name = "${var.name}"
}

resource "alicloud_route_table" "default" {
  associate_type = "Gateway"
  vpc_id         = alicloud_vpc.default.id
  description    = var.description_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  route_table_name = var.name
}
