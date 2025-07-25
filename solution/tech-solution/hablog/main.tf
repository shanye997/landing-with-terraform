# 查询实例实例规格
data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.g7"
}

data "alicloud_zones" "default" {
  available_instance_type = data.alicloud_instance_types.default.ids.0
}

data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.ids.0
  instance_charge_type     = "PostPaid"
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_alb_zones" "default" {}

data "alicloud_images" "instance_image" {
  name_regex    = "^aliyun_3_9_x64_20G_*"
  most_recent   = true
  owners        = "system"
  instance_type = data.alicloud_instance_types.default.ids.0
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "${var.common_name}-vpc"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_vswitch" "ecs_vswitch1" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "192.168.1.0/24"
  zone_id      = data.alicloud_zones.default.ids.0
  vswitch_name = "${var.common_name}-vsw"
}

resource "alicloud_vswitch" "ecs_vswitch2" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "192.168.2.0/24"
  zone_id      = data.alicloud_zones.default.ids.1
  vswitch_name = "${var.common_name}-vsw"
}

resource "alicloud_vswitch" "alb_vswitch3" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "192.168.3.0/24"
  zone_id      = data.alicloud_alb_zones.default.ids.0
  vswitch_name = "${var.common_name}-vsw"
}

resource "alicloud_vswitch" "alb_vswitch4" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "192.168.4.0/24"
  zone_id      = data.alicloud_alb_zones.default.ids.1
  vswitch_name = "${var.common_name}-vsw"
}

resource "alicloud_vswitch" "rds_vswitch5" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "192.168.5.0/24"
  zone_id      = data.alicloud_db_zones.default.ids.0
  vswitch_name = "${var.common_name}-vsw"
}

resource "alicloud_security_group" "security_group" {
  security_group_name = "${var.common_name}-sg"
  vpc_id              = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "security_group_rule1" {
  security_group_id = alicloud_security_group.security_group.id
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "80/80"
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "security_group_rule2" {
  security_group_id = alicloud_security_group.security_group.id
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "443/443"
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_instance" "ecs_instance1" {
  instance_name              = "${var.common_name}-ecs-1"
  image_id                   = data.alicloud_images.instance_image.images.0.id
  instance_type              = data.alicloud_instance_types.default.ids.0
  security_groups            = [alicloud_security_group.security_group.id]
  vswitch_id                 = alicloud_vswitch.ecs_vswitch1.id
  system_disk_category       = "cloud_essd"
  internet_max_bandwidth_out = 5
  password                   = var.ecs_instance_password
}

resource "alicloud_instance" "ecs_instance2" {
  instance_name              = "${var.common_name}-ecs-2"
  image_id                   = data.alicloud_images.instance_image.images.0.id
  instance_type              = data.alicloud_instance_types.default.ids.0
  security_groups            = [alicloud_security_group.security_group.id]
  vswitch_id                 = alicloud_vswitch.ecs_vswitch2.id
  system_disk_category       = "cloud_essd"
  internet_max_bandwidth_out = 5
  password                   = var.ecs_instance_password
}

resource "alicloud_alb_load_balancer" "alb" {
  load_balancer_name     = "${var.common_name}-alb"
  load_balancer_edition  = "Basic"
  vpc_id                 = alicloud_vpc.vpc.id
  address_type           = "Internet"
  address_allocated_mode = "Fixed"

  load_balancer_billing_config {
    pay_type = "PayAsYouGo"
  }

  zone_mappings {
    zone_id    = data.alicloud_alb_zones.default.ids.0
    vswitch_id = alicloud_vswitch.alb_vswitch3.id
  }

  zone_mappings {
    zone_id    = data.alicloud_alb_zones.default.ids.1
    vswitch_id = alicloud_vswitch.alb_vswitch4.id
  }
}

resource "alicloud_alb_server_group" "alb_server_group" {
  server_group_name = "${var.common_name}-server-group"
  vpc_id            = alicloud_vpc.vpc.id
  protocol          = "HTTP"

  health_check_config {
    health_check_enabled      = true
    health_check_protocol     = "HTTP"
    health_check_path         = "/"
    health_check_codes        = ["http_2xx", "http_3xx", "http_4xx"]
    health_check_connect_port = 80
  }

  sticky_session_config {
    sticky_session_enabled = false
  }

  servers {
    port        = 80
    server_type = "Ecs"
    server_id   = alicloud_instance.ecs_instance1.id
    server_ip   = alicloud_instance.ecs_instance1.primary_ip_address
    weight      = 100
  }

  servers {
    port        = 80
    server_type = "Ecs"
    server_id   = alicloud_instance.ecs_instance2.id
    server_ip   = alicloud_instance.ecs_instance2.primary_ip_address
    weight      = 100
  }
}

resource "alicloud_alb_listener" "alb_listener" {
  listener_protocol = "HTTP"
  listener_port     = 80
  load_balancer_id  = alicloud_alb_load_balancer.alb.id

  default_actions {
    type = "ForwardGroup"
    forward_group_config {
      server_group_tuples {
        server_group_id = alicloud_alb_server_group.alb_server_group.id
      }
    }
  }
}

resource "alicloud_db_instance" "rds_instance" {
  engine             = "MySQL"
  engine_version     = "8.0"
  instance_type      = data.alicloud_db_instance_classes.default.ids.0
  instance_storage   = 40
  vpc_id             = alicloud_vpc.vpc.id
  vswitch_id         = alicloud_vswitch.rds_vswitch5.id
  security_group_ids = [alicloud_security_group.security_group.id]

}

resource "alicloud_db_database" "rds_database" {
  count         = (alicloud_db_instance.rds_instance.engine == "MySQL" ? 1 : 0)
  name          = var.database_name
  description   = "${var.database_name} database"
  instance_id   = alicloud_db_instance.rds_instance.id
  character_set = "utf8mb4"
}

resource "alicloud_rds_account" "create_db_user" {
  db_instance_id   = alicloud_db_instance.rds_instance.id
  account_name     = var.db_user_name
  account_password = var.db_password
  account_type     = "Super"
}

locals {
  prepare_data_script = <<-SHELL
    #!/bin/bash

    yum install -y mysql

    mkdir -p /data
    cat <<"EOF" >> /data/script.sql
    -- script.sql
    USE ${var.database_name};
    CREATE TABLE `todo_list` (
    `id` bigint NOT NULL COMMENT 'id',
    `title` varchar(128) NOT NULL COMMENT 'title',
    `desc` text NOT NULL COMMENT 'description',
    `status` varchar(128) NOT NULL COMMENT 'status 未开始、进行中、已完成、已取消',
    `priority` varchar(128) NOT NULL COMMENT 'priority 高、中、低',
    `expect_time` datetime COMMENT 'expect time',
    `actual_completion_time` datetime COMMENT 'actual completion time',
    `gmt_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'modified time',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
    ;
    INSERT INTO todo_list
    (id, title, `desc`, `status`, priority, expect_time)
    value(1,  "创建一个应用", "使用阿里云解决方案搭建一个应用", "进行中", "高", "2024-04-01 00:00:00")
    EOF

    mysql -h${alicloud_db_instance.rds_instance.connection_string} -u${var.db_user_name} -p${var.db_password} < /data/script.sql
    SHELL

  install_app_script = <<-SHELL
    #!/bin/bash
    sudo yum -y install java-1.8.0-openjdk-devel.x86_64

    cat <<EOT >> ~/.bash_profile
    export APPLETS_RDS_ENDPOINT=${alicloud_db_instance.rds_instance.connection_string}
    export APPLETS_RDS_USER=${var.db_user_name}
    export APPLETS_RDS_PASSWORD=${var.db_password}
    export APPLETS_RDS_DB_NAME=${var.database_name}
    export APP_MANUAL_DEPLOY=false
    EOT
    source ~/.bash_profile
    wget https://help-static-aliyun-doc.aliyuncs.com/tech-solution/cloud-demo-0.0.2.jar
    nohup java -jar cloud-demo-0.0.2.jar > demo.log 2>&1 &
    SHELL
}

resource "alicloud_ecs_command" "prepare_data" {
  depends_on      = [alicloud_db_database.rds_database, alicloud_rds_account.create_db_user]
  name            = "tf-PrepareData"
  command_content = base64encode(local.prepare_data_script)
  description     = "create tables"
  type            = "RunShellScript"
  working_dir     = "/root"
}

resource "alicloud_ecs_invocation" "invoke_script" {
  instance_id = [alicloud_instance.ecs_instance1.id]
  command_id  = alicloud_ecs_command.prepare_data.id
}


resource "alicloud_ecs_command" "install_app" {
  depends_on      = [alicloud_ecs_invocation.invoke_script]
  name            = "tf-testAcc"
  command_content = base64encode(local.install_app_script)
  description     = "Install App"
  type            = "RunShellScript"
  working_dir     = "/root"
}

resource "alicloud_ecs_invocation" "invoke_app" {
  instance_id = [alicloud_instance.ecs_instance1.id, alicloud_instance.ecs_instance2.id]
  command_id  = alicloud_ecs_command.install_app.id
}