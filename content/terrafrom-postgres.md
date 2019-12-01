+++
title = "terrafrom与postgres"
date =  2019-09-11T16:28:59+08:00

[taxonomies]
categories = ["postgress","terrafrom"]
tags = ["postgress","terrafrom"]
+++

- ## terrafrom 在资源管理上是个好工具。 可以对接N多个资源。
#### 思考一 可以管理申请的测试或生产数据库，既保留了数据库信息，也保证了创建出的数据库配置的统一性。
（如 mysql utf8和utf8mb4配置的坑）
```bash
# postgres链接方法定义
provider "postgresql" {
  host     = "127.0.0.1"
  port     = "5432"
  username = "postgres"
  password = "toor"
  ssl_mode = "disable"
}

# 数据库定义
resource "postgresql_role" "myuser" {
  name      = "myuser"
  login     = true
  password  = "put_your_user_password"
  encrypted = true
}



# 权限定义
resource "postgresql_database" "myuser" {
  name  = "myuser"
  owner = "${postgresql_role.myuser.name}"
}


# terraform init && terraform plan && terraform apply

```



# 参考
[terraform-providers](https://www.terraform.io/docs/providers/index.html)
[terraform-aws-rds](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-postgres)
[terraform-pg](https://qiita.com/yamamoto-febc/items/3979d81c6b0aba324a07)
