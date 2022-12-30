env = "dev"

## VPC
vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = ["10.0.0.0/17", "10.0.128.0/17"]
subnet_azs        = ["us-east-1a", "us-east-1b"]

## Default VPC Information
default_vpc_id          = "vpc-042992ad68653bd97"
default_vpc_cidr_block  = "172.31.0.0/16"
default_vpc_route_table = "rtb-06dc24aa66c02de3b"
