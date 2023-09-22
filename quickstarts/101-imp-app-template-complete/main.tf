resource "alicloud_imp_app_template" "default" {
  integration_mode  = "paasSDK"
  scene             = "business"
  app_template_name = var.app_template_name_var
  component_list = [
    "component.live"
  ]
  config_list {
    key   = "config.appCallbackAuthKey"
    value = "tf-example-jdD4qhGOxxxxxxxx"
  }
  config_list {
    key   = "config.appCallbackUrl"
    value = "http://aliyun.com/tf-example-jdD4qhGOxxxxxxxx"
  }
  config_list {
    key   = "config.callbackClass.live"
    value = "config.callbackEvent.liveStatusUpdate"
  }
  config_list {
    key   = "config.callbackClass.user"
    value = "config.callbackEvent.userEnterRoomUpdate"
  }
  config_list {
    key   = "config.livePullDomain"
    value = "tf-example-jdD4qhGOxxxxxxxx.com"
  }
  config_list {
    key   = "config.livePushDomain"
    value = "tf-example-jdD4qhGOxxxxxxxx.com"
  }
  config_list {
    key   = "config.multipleClientsLogin"
    value = "true"
  }
  config_list {
    value = "cn-shanghai"
    key   = "config.regionId"
  }
  config_list {
    key   = "config.streamChangeCallbackUrl"
    value = "https://aliyun.com/tf-example-jdD4qhGOxxxxxxxx"
  }

}
