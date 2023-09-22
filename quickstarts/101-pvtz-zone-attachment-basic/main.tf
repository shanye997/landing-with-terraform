resource "alicloud_vpc" "default" {
  vpc_name   = "tf-examplePvtzZoneAttachmentConfig"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vpc" "default1" {
  name       = "tf-examplePvtzZoneAttachmentConfigUpdate"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_pvtz_zone" "default" {
  name = "tf-example1492393.test.com"
}

resource "alicloud_pvtz_zone_attachment" "default" {
  vpcs {
    vpc_id = alicloud_vpc.default.id
  }
  vpcs {
    vpc_id = alicloud_vpc.default1.id
  }

  zone_id = alicloud_pvtz_zone.default.id
}
