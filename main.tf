module "vpc" {
  source         = "github.com/raghudevopsb60/tf-module-vpc"
  vpc_cidr_block = var.vpc_cidr_block
}
