provider "aws" {
  region = var.region
}

variable "env_tag" {
  default = "dev"
}

module "vpc" {
  source = "../modules/vpc"
  cidr_block = var.vpc_cidr_block
  environment_tag = var.env_tag
}

module "public_subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.public_cidr_block
  environment_tag = var.env_tag
  availability_zone = var.azs
  map_public_ip = true
}

module "private_subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.private_cidr_block
  environment_tag = var.env_tag
  availability_zone = var.azs
  map_public_ip = false
}

module "gateway" {
  source = "../modules/internet_gateway"
  environment_tag = var.env_tag
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source = "../modules/nat"
  internet_gw = module.gateway
  public_subnet_id = module.public_subnet.subnet_id
  environment_tag = var.env_tag
}

module "route_table" {
  source = "../modules/route_table"
  environment_tag = var.env_tag
  gw_id = module.gateway.gw_id
  vpc_id = module.vpc.vpc_id
  nat_gw_id = module.nat_gateway.id
}

module "route_table_association" {
  source = "../modules/route_table_association"
  private_route_table_id = module.route_table.private_route_table_id
  private_subnet_id = module.private_subnet.subnet_id
  public_route_table_id = module.route_table.public_route_table_id
  public_subnet_id = module.public_subnet.subnet_id
}

module "ami" {
  source = "../modules/ami"
  environment_tag = var.env_tag
}

module "key-pair" {
  source = "../modules/key_pair"
  key_name = "ec2-key-name"
  environment_tag = var.env_tag
}

module "security_group" {
  source = "../modules/security_group"
  environment_tag = var.env_tag
  vpc_id = module.vpc.vpc_id
}

module "public_ec2" {
  source = "../modules/ec2"
  ami_id = module.ami.ami_id
  key_name = module.key-pair.key_pair_name
  subnet_id = module.public_subnet.subnet_id
  environment_tag = var.env_tag
  security_groups = [module.security_group.id]
}

module "protected_ec2" {
  source = "../modules/ec2"
  ami_id = module.ami.ami_id
  key_name = module.key-pair.key_pair_name
  subnet_id = module.private_subnet.subnet_id
  environment_tag = var.env_tag
  security_groups = [module.security_group.id]
}
