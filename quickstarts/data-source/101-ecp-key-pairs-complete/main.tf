resource "alicloud_ecp_key_pair" "default" {
  key_pair_name   = "tf-exampleEcpKeyPairsTest30192"
  public_key_body = "ssh-rsa AAAAB3Nza12345678qwertyuudsfsg"
}

data "alicloud_ecp_key_pairs" "default" {
  name_regex = "tf-exampleEcpKeyPairsTest30192fake"
  ids = [
    "${alicloud_ecp_key_pair.default.id}-fake"
  ]
}
