provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
  azs    = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source         = "./modules/ec2"
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.public_subnets[0]
  instance_type  = "t2.micro"
  ami            = "ami-123456"
  key_name       = "my-key"
  security_groups = [module.vpc.default_security_group]
}

module "rds" {
  source         = "./modules/rds"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnets
  db_instance_class = "db.t2.micro"
  allocated_storage = 20
  engine         = "mysql"
  username       = "admin"
  password       = "password"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "my-app-bucket"
}

module "iam" {
  source = "./modules/iam"
  application_name = "my-application"
}
