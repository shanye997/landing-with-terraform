variable "domain" {
  default = "com.aliyun.cn-hangzhou.oss"
}

variable "gateway_endpoint_descrption_var" {
  default = "test-gateway-endpoint"
}

variable "gateway_endpoint_name_var" {
  default = "tf-examplecn-hangzhouvpcgatewayendpoint47398"
}

variable "policy_document_var" {
  default = "{ \\\"Version\\\" : \\\"1\\\", \\\"Statement\\\" : [ { \\\"Effect\\\" : \\\"Allow\\\", \\\"Resource\\\" : [ \\\"*\\\" ], \\\"Action\\\" : [ \\\"*\\\" ], \\\"Principal\\\" : [ \\\"*\\\" ] } ] }"
}

