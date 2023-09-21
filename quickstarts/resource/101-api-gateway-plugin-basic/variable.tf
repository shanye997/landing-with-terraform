variable "name" {
  default = "tf_exampleapigatewayplugin2888"
}

variable "plugin_data_var" {
  default = "{\\\"allowOrigins\\\": \\\"api.foo.com\\\",\\\"allowMethods\\\": \\\"GET,POST,PUT,DELETE,HEAD,OPTIONS,PATCH\\\",\\\"allowHeaders\\\": \\\"Authorization,Accept,Accept-Ranges,Cache-Control,Range,Date,Content-Type,Content-Length,Content-MD5,User-Agent,X-Ca-Signature,X-Ca-Signature-Headers,X-Ca-Signature-Method,X-Ca-Key,X-Ca-Timestamp,X-Ca-Nonce,X-Ca-Stage,X-Ca-Request-Mode,x-ca-deviceid\\\",\\\"exposeHeaders\\\": \\\"Content-MD5,Server,Date,Latency,X-Ca-Request-Id,X-Ca-Error-Code,X-Ca-Error-Message\\\",\\\"maxAge\\\": 172800,\\\"allowCredentials\\\": true}"
}

