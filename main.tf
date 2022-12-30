module "vpc" {
  source            = "github.com/raghudevopsb69/tf-module-vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  env               = var.env
  subnet_azs        = var.subnet_azs
  subnet_cidr_block = var.subnet_cidr_block
}
