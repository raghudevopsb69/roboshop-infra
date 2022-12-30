module "vpc" {
  source                  = "github.com/raghudevopsb69/tf-module-vpc"
  vpc_cidr_block          = var.vpc_cidr_block
  env                     = var.env
  subnet_azs              = var.subnet_azs
  subnet_cidr_block       = var.subnet_cidr_block
  default_vpc_id          = var.default_vpc_id
  default_vpc_cidr_block  = var.default_vpc_cidr_block
  default_vpc_route_table = var.default_vpc_route_table
}

