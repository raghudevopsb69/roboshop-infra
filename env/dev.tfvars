env = "dev"

## Default VPC Information
default_vpc_id          = "vpc-042992ad68653bd97"
default_vpc_cidr_block  = "172.31.0.0/16"
default_vpc_route_table = "rtb-06dc24aa66c02de3b"
workstation_ip          = "172.31.1.61/32"

## KMS Information
kms_key_id = "arn:aws:kms:us-east-1:739561048503:key/09ef6567-23e3-4af8-a33a-22915a89274d"


## VPC

vpc = {
  dev = {
    vpc_cidr_block           = "10.0.0.0/16"
    public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
    app_subnet_cidr_block    = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr_block     = ["10.0.4.0/24", "10.0.5.0/24"]
    subnet_azs               = ["us-east-1a", "us-east-1b"]
  }
}

docdb = {
  dev = {
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
  dev = {
    engine                  = "mysql"
    engine_version          = "5.7.33"
    dbname                  = "dummy"
    skip_final_snapshot     = true
    backup_retention_period = 1
    preferred_backup_window = "07:00-09:00"
    storage_encrypted       = true
    instance_count          = 1
    instance_class          = "db.t3.micro"
  }
}
