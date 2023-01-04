module "vpc" {
  source                  = "github.com/raghudevopsb69/tf-module-vpc"
  env                     = var.env
  default_vpc_id          = var.default_vpc_id
  default_vpc_cidr_block  = var.default_vpc_cidr_block
  default_vpc_route_table = var.default_vpc_route_table
  workstation_ip          = var.workstation_ip

  for_each                 = var.vpc
  vpc_cidr_block           = each.value.vpc_cidr_block
  public_subnet_cidr_block = each.value.public_subnet_cidr_block
  app_subnet_cidr_block    = each.value.app_subnet_cidr_block
  db_subnet_cidr_block     = each.value.db_subnet_cidr_block
  subnet_azs               = each.value.subnet_azs
}

module "docdb" {
  source     = "github.com/raghudevopsb69/tf-module-docdb"
  env        = var.env
  kms_key_id = var.kms_key_id

  for_each                = var.docdb
  engine                  = each.value.engine
  backup_retention_period = each.value.backup_retention_period
  preferred_backup_window = each.value.preferred_backup_window
  skip_final_snapshot     = each.value.skip_final_snapshot
  storage_encrypted       = each.value.storage_encrypted
  instance_count          = each.value.instance_count
  instance_class          = each.value.instance_class

  vpc = module.vpc
}

module "rds" {
  source     = "github.com/raghudevopsb69/tf-module-rds"
  env        = var.env
  kms_key_id = var.kms_key_id

  for_each                = var.rds
  engine                  = each.value.engine
  backup_retention_period = each.value.backup_retention_period
  preferred_backup_window = each.value.preferred_backup_window
  skip_final_snapshot     = each.value.skip_final_snapshot
  storage_encrypted       = each.value.storage_encrypted
  engine_version          = each.value.engine_version
  dbname                  = each.value.dbname

  vpc = module.vpc
}


output "vpc" {
  value = module.vpc
}
