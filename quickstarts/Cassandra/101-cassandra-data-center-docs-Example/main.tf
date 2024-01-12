resource "alicloud_cassandra_cluster" "default" {
  cluster_name        = "cassandra-cluster-name-tf"
  data_center_name    = "dc-1"
  auto_renew          = "false"
  instance_type       = "cassandra.c.large"
  major_version       = "3.11"
  node_count          = "2"
  pay_type            = "PayAsYouGo"
  vswitch_id          = "vsw-xxxx1"
  disk_size           = "160"
  disk_type           = "cloud_ssd"
  maintain_start_time = "18:00Z"
  maintain_end_time   = "20:00Z"
  ip_white            = "127.0.0.1"
}

resource "alicloud_cassandra_data_center" "default" {
  cluster_id       = alicloud_cassandra_cluster.default.id
  data_center_name = "dc-2"
  auto_renew       = "false"
  instance_type    = "cassandra.c.large"
  node_count       = "2"
  pay_type         = "PayAsYouGo"
  vswitch_id       = "vsw-xxxx2"
  disk_size        = "160"
  disk_type        = "cloud_ssd"
}