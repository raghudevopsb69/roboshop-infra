env = "dev"

## Default VPC Information
default_vpc_id          = "vpc-042992ad68653bd97"
default_vpc_cidr_block  = "172.31.0.0/16"
default_vpc_route_table = "rtb-06dc24aa66c02de3b"

## VPC

vpc = {
  dev = {
    vpc_cidr_block            = "10.0.0.0/16"
    public_subnet_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"]
    private_subnet_cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
    subnet_azs                = ["us-east-1a", "us-east-1b"]
  }
}