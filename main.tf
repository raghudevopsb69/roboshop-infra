module "vpc" {
  source                  = "github.com/raghudevopsb69/tf-module-vpc"
  env                     = var.env
  default_vpc_id          = var.default_vpc_id
  default_vpc_cidr_block  = var.default_vpc_cidr_block
  default_vpc_route_table = var.default_vpc_route_table

  for_each                 = var.vpc
  vpc_cidr_block           = each.value.vpc_cidr_block
  public_subnet_cidr_block = each.value.public_subnet_cidr_block
  app_subnet_cidr_block    = each.value.app_subnet_cidr_block
  db_subnet_cidr_block     = each.value.db_subnet_cidr_block
  subnet_azs               = each.value.subnet_azs
}

