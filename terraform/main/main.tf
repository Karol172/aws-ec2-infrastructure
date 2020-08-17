provider "aws" {
  region = "eu-central-1"
}

variable "env_tag" {
  default = "dev"
}

module "vpc" {
  source = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
  environment_tag = var.env_tag
}

module "public_subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.0.0/24"
  environment_tag = var.env_tag
  availability_zone = "eu-central-1a"
  map_public_ip = true
}

module "private_subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  environment_tag = var.env_tag
  availability_zone = "eu-central-1a"
  map_public_ip = false
}

module "gateway" {
  source = "../modules/internet_gateway"
  environment_tag = var.env_tag
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "../modules/route_table"
  environment_tag = var.env_tag
  gw_id = module.gateway.gw_id
  vpc_id = module.vpc.vpc_id
}

module "route_table_association" {
  source = "../modules/route_table_association"
  route_table_id = module.route_table.route_table_id
  subnet_id = module.public_subnet.subnet_id
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
