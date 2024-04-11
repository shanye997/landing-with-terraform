resource "random_integer" "default" {
  max = 99999
  min = 10000
}

resource "alicloud_log_project" "default" {
  name = "example-value-${random_integer.default.result}"
}

resource "alicloud_log_store" "default" {
  project = alicloud_log_project.default.name
  name    = "example-value"
}

resource "alicloud_ram_role" "default" {
  name        = "fcservicerole-${random_integer.default.result}"
  document    = <<EOF
  {
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Effect": "Allow",
          "Principal": {
            "Service": [
              "fc.aliyuncs.com"
            ]
          }
        }
      ],
      "Version": "1"
  }
  EOF
  description = "this is a example"
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = alicloud_ram_role.default.name
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_fc_service" "default" {
  name        = "example-value-${random_integer.default.result}"
  description = "example-value"
  role        = alicloud_ram_role.default.arn
  log_config {
    project                 = alicloud_log_project.default.name
    logstore                = alicloud_log_store.default.name
    enable_instance_metrics = true
    enable_request_metrics  = true
  }
}

resource "alicloud_oss_bucket" "default" {
  bucket = "terraform-example-${random_integer.default.result}"
}
# If you upload the function by OSS Bucket, you need to specify path can't upload by content.
resource "alicloud_oss_bucket_object" "default" {
  bucket  = alicloud_oss_bucket.default.id
  key     = "index.py"
  content = "import logging \ndef handler(event, context): \nlogger = logging.getLogger() \nlogger.info('hello world') \nreturn 'hello world'"
}

resource "alicloud_fc_function" "default" {
  service     = alicloud_fc_service.default.name
  name        = "terraform-example"
  description = "example"
  oss_bucket  = alicloud_oss_bucket.default.id
  oss_key     = alicloud_oss_bucket_object.default.key
  memory_size = "512"
  runtime     = "python2.7"
  handler     = "hello.handler"
}

resource "alicloud_fc_custom_domain" "default" {
  domain_name = "terraform.functioncompute.com"
  protocol    = "HTTP"
  route_config {
    path          = "/login/*"
    service_name  = alicloud_fc_service.default.name
    function_name = alicloud_fc_function.default.name
    qualifier     = "?query"
    methods       = ["GET", "POST"]
  }
  cert_config {
    cert_name   = "example"
    certificate = "-----BEGIN CERTIFICATE-----\nMIICWD****-----END CERTIFICATE-----"
    private_key = "-----BEGIN RSA PRIVATE KEY-----\nMIICX****n-----END RSA PRIVATE KEY-----"
  }
}