module "default_vpc" {
  source                     = "./local_modules/vpc"
  name                       = "DefaultVPCCreatedByIDP"
  cidr                       = "10.0.0.0/16"
  azs                        = slice(data.aws_availability_zones.available.names, 0, 1)
  manage_default_route_table = false
  manage_default_security_group = false
  public_subnets             = ["10.0.0.0/24"]
  public_subnet_tags = {
    Name : "DefaultPublicSubnetCreatedByIDP"
  }
  tags = {
    Name: "DefaultVPCCreatedByIDP"
  }
}

module "default_sg" {
  source              = "./local_modules/sg"
  name                = "DefaultSGCreatedByIDP"
  description         = "Security group created by IDP"
  vpc_id              = module.default_vpc.vpc_id
  ingress_rules       = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags = {
    Name : "DefaultSGCreatedByIDP"
  }
}