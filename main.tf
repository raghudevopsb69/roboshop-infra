module "vpc" {
  source         = "github.com/raghudevopsb69/tf-module-vpc"
  vpc_cidr_block = var.vpc_cidr_block
}
