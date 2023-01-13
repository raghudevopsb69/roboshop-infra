env = "prod"

## Default VPC Information
default_vpc_id          = "vpc-042992ad68653bd97"
default_vpc_cidr_block  = "172.31.0.0/16"
default_vpc_route_table = "rtb-06dc24aa66c02de3b"
workstation_ip          = "172.31.1.61/32"
allow_ssh_cidr          = ["172.31.1.61/32"]

## KMS Information
kms_key_id = "arn:aws:kms:us-east-1:739561048503:key/09ef6567-23e3-4af8-a33a-22915a89274d"

## Route53 Info
domain = "devopsb69.online"

## VPC

vpc = {
  prod = {
    vpc_cidr_block           = "10.10.0.0/16"
    public_subnet_cidr_block = ["10.10.0.0/24", "10.10.1.0/24"]
    app_subnet_cidr_block    = ["10.10.2.0/24", "10.10.3.0/24"]
    db_subnet_cidr_block     = ["10.10.4.0/24", "10.10.5.0/24"]
    subnet_azs               = ["us-east-1a", "us-east-1b"]
  }
}

docdb = {
  prod = {
    engine                  = "docdb"
    backup_retention_period = 1
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    storage_encrypted       = true
    instance_count          = 1
    instance_class          = "db.t3.medium"
  }
}

rds = {
  prod = {
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.0"
    dbname                  = "dummy"
    skip_final_snapshot     = true
    backup_retention_period = 1
    preferred_backup_window = "07:00-09:00"
    storage_encrypted       = true
    instance_count          = 1
    instance_class          = "db.t3.small"
  }
}

elasticache = {
  prod = {
    engine          = "redis"
    engine_version  = "6.x"
    num_cache_nodes = 1
    node_type       = "cache.t3.micro"
    az_mode         = "single-az"
  }
}

rabbitmq = {
  prod = {
    instance_type = "t3.micro"
  }
}

app = {
  catalogue = {
    component        = "catalogue"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 8080
    lb_rule_priority = 101
  }
  user = {
    component        = "user"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 8080
    lb_rule_priority = 102
  }
  cart = {
    component        = "cart"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 8080
    lb_rule_priority = 103
  }
  shipping = {
    component        = "shipping"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 8080
    lb_rule_priority = 104
  }
  payment = {
    component        = "payment"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 8080
    lb_rule_priority = 105
  }
  frontend = {
    component        = "frontend"
    instance_type    = "t3.micro"
    desired_capacity = 2
    max_size         = 4
    min_size         = 2
    app_port         = 80
    lb_rule_priority = 100
  }
}

alb = {
  public = {
    name     = "public-alb"
    internal = false

  }
  private = {
    name     = "private-alb"
    internal = true

  }
}
